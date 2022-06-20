import 'package:dio/dio.dart';
import 'package:fehu_app/app/data/models/all_posts_model/all_posts_model.dart';
import 'package:fehu_app/app/data/models/all_posts_model/post.dart';
import 'package:fehu_app/app/data/models/all_student_activities_model/all_student_activities_model.dart';
import 'package:fehu_app/app/data/services/app_services.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../data/models/all_student_activities_model/student_activity.dart';
import '../../../data/providers/retrofit.dart';
import '../../../widgets/dialogs.dart';

class AllPostsController extends GetxController {
  RestClient client = RestClient(Dio(
      BaseOptions(headers: Constants().headers, baseUrl: Constants.baseUrl)));
  RxBool isExpanded = false.obs;
  final AppServices appServices = Get.find<AppServices>();
  @override
  onInit() {
    super.onInit();
    fetchStudentActivities();
    fetchposts();
  }

  RxBool isStudentSctivitiesLoading = RxBool(false);
  RxList<StudentActivity> studentActivities = <StudentActivity>[].obs;
  fetchStudentActivities() async {
    isStudentSctivitiesLoading.value = true;
    AllStudentActivitiesModel response;
    try {
      response = await client.getAllStudentActivities();
      if (response.status == 200) {
        isStudentSctivitiesLoading.value = false;
        studentActivities.value = response.studentActivities!;
      } else {
        isStudentSctivitiesLoading.value = false;
        errorGetBar(response.message);
      }
    } on DioError catch (e) {
      isStudentSctivitiesLoading.value = false;
      switch (e.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
          errorGetBar('خطأ في الاتصال بالخادم');
          break;
        case DioErrorType.response:
          response = AllStudentActivitiesModel.fromJson(e.response!.data);
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

  RxBool isPostsLoading = RxBool(false);
  RxList<Post> posts = <Post>[].obs;
  fetchposts() async {
    isPostsLoading.value = true;
    AllPostsModel response;
    try {
      response = await client.getAllPosts();
      if (response.status == 200) {
        isPostsLoading.value = false;
        posts.value = response.posts!;
      } else {
        isPostsLoading.value = false;
        errorGetBar(response.message);
      }
    } on DioError catch (e) {
      isPostsLoading.value = false;
      switch (e.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
          errorGetBar('خطأ في الاتصال بالخادم');
          break;
        case DioErrorType.response:
          response = AllPostsModel.fromJson(e.response!.data);
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
