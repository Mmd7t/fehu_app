import 'package:dio/dio.dart';
import 'package:fehu_app/app/data/models/batches_model/batches_model.dart';
import 'package:fehu_app/app/data/models/departments_model/department.dart';
import 'package:fehu_app/app/data/models/departments_model/departments_model.dart';
import 'package:fehu_app/app/data/models/global_response_model.dart';
import 'package:fehu_app/app/data/models/login_response_model/login_response_model.dart';
import 'package:fehu_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../data/models/batches_model/batch.dart';
import '../../../data/models/register_model.dart';
import '../../../data/providers/retrofit.dart';
import '../../../data/services/app_services.dart';
import '../../../widgets/dialogs.dart';

class AuthController extends GetxController {
  RestClient client = RestClient(Dio(
      BaseOptions(headers: Constants().headers, baseUrl: Constants.baseUrl)));

  final appServices = Get.find<AppServices>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool loginObsecure = RxBool(true);
  RxBool signupObsecure = RxBool(true);

  @override
  onInit() {
    super.onInit();
    fetchDepartments();
    fetchBatches();
  }

  /*--------------------------------------------------------------------------*/
  /*-------------------------------  Register  -------------------------------*/
  /*--------------------------------------------------------------------------*/
  RxString fullName = ''.obs;
  RxString username = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString phone = ''.obs;
  RxString section = ''.obs;
  RxInt departmentId = 0.obs;
  RxInt batchId = 1.obs;
  RxString academicYear = ''.obs;

  register() async {
    loadingDialog();
    GlobalResponseModel response;
    try {
      response = await client.postRegister(RegisterRequestModel(
        fullName: fullName.value,
        email: email.value,
        password: password.value,
        username: username.value,
        academicYear: academicYear.value,
        departmentId: departmentId.value,
        phone: phone.value,
        section: section.value,
        batchId: batchId.value,
      ).toJson());
      if (response.status == 200) {
        Get.back();
        login();
        successGetBar(response.message);
      } else {
        Get.back();
        print(response);
        errorGetBar(response.message);
      }
    } on DioError catch (e) {
      Get.back();
      switch (e.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
          errorGetBar('خطأ في الاتصال بالخادم');
          break;
        case DioErrorType.response:
          errorGetBar(e.response!.data['message'].toString());
          Get.log(e.message);
          Get.log(e.response!.data['message'].toString());
          print(e.response);
          break;
        default:
          errorGetBar('${e.error}');
          break;
      }
    }
  }

  login() async {
    loadingDialog();
    LoginResponseModel response;
    try {
      response = await client.postLogin(username.value, password.value, '');
      if (response.status == 200) {
        Get.back();
        appServices.saveAccessToken(response.data!.tokenData!.accessToken!);
        appServices.saveUserId(response.data!.id!);
        appServices.saveusername(response.data!.fullName!);
        appServices.saveuseremail(response.data!.email!);
        appServices.saveuserphone(response.data!.phone!);
        appServices.saveDrives([
          response.data!.driveLinks!.driveLink0!,
          response.data!.driveLinks!.driveLink1!,
          response.data!.driveLinks!.driveLink2!,
          response.data!.driveLinks!.driveLink3!,
          response.data!.driveLinks!.driveLink4!
        ]);
        Get.offNamedUntil(Routes.home, (route) => false);
      } else {
        Get.back();
        errorGetBar(response.message);
      }
    } on DioError catch (e) {
      Get.back();
      switch (e.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
          errorGetBar('خطأ في الاتصال بالخادم');
          break;
        case DioErrorType.response:
          response = LoginResponseModel.fromJson(e.response!.data);
          if (response.status == 200) {
            errorGetBar('${response.message}');
          } else {
            errorGetBar(response.message);
          }
          break;
        default:
          errorGetBar('${e.error}');
          break;
      }
    }
  }

  RxBool isDepartmentsLoading = RxBool(false);
  RxList<Department> departments = <Department>[].obs;
  fetchDepartments() async {
    isDepartmentsLoading.value = true;
    DepartmentsModel response;
    try {
      response = await client.getDepartments();
      if (response.status == 200) {
        isDepartmentsLoading.value = false;
        departments.value = response.departments!;
      } else {
        isDepartmentsLoading.value = false;
        errorGetBar(response.message);
      }
    } on DioError catch (e) {
      isDepartmentsLoading.value = false;
      switch (e.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
          errorGetBar('خطأ في الاتصال بالخادم');
          break;
        case DioErrorType.response:
          response = DepartmentsModel.fromJson(e.response!.data);
          if (response.status == 200) {
            errorGetBar('${response.message}');
          } else {
            errorGetBar('حدث خطأ غير متوقع\nأعد المحاولة مرة اخرى');
          }
          break;
        default:
          errorGetBar('${e.error}');
          break;
      }
    }
  }

  RxBool isBatchesLoading = RxBool(false);
  RxList<Batch> batches = <Batch>[].obs;
  fetchBatches() async {
    isBatchesLoading.value = true;
    BatchesModel response;
    try {
      response = await client.getAllBatches();
      if (response.status == 200) {
        isBatchesLoading.value = false;
        batches.value = response.batches!;
      } else {
        isBatchesLoading.value = false;
        errorGetBar(response.message);
      }
    } on DioError catch (e) {
      isBatchesLoading.value = false;
      switch (e.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
          errorGetBar('خطأ في الاتصال بالخادم');
          break;
        case DioErrorType.response:
          response = BatchesModel.fromJson(e.response!.data);
          if (response.status == 200) {
            errorGetBar('${response.message}');
          } else {
            errorGetBar('حدث خطأ غير متوقع\nأعد المحاولة مرة اخرى');
          }
          break;
        default:
          errorGetBar('${e.error}');
          break;
      }
    }
  }
}
