import 'package:dio/dio.dart';
import 'package:fehu_app/app/data/models/student_activity_by_id_model/post.dart';
import 'package:fehu_app/app/data/models/student_activity_by_id_model/student_activity_by_id_model.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants.dart';
import '../../../data/providers/retrofit.dart';
import '../../../widgets/dialogs.dart';

class StudentActivityController extends GetxController {
  RestClient client = RestClient(Dio(
      BaseOptions(headers: Constants().headers, baseUrl: Constants.baseUrl)));

  RxBool isLoading = RxBool(false);
  RxList<SAPost> posts = <SAPost>[].obs;
  fetchSAPosts(int id) async {
    isLoading.value = true;
    StudentActivityByIdModel response;
    try {
      response = await client.getStudentActivityBYId(id);
      if (response.status == 200) {
        isLoading.value = false;
        posts.value = response.studentActivity!.posts!;
      } else {
        isLoading.value = false;
        errorGetBar(response.message);
      }
    } on DioError catch (e) {
      isLoading.value = false;
      switch (e.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
          errorGetBar('خطأ في الاتصال بالخادم');
          break;
        case DioErrorType.response:
          response = StudentActivityByIdModel.fromJson(e.response!.data);
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
