import 'package:dio/dio.dart';
import 'package:fehu_app/app/data/models/all_student_activities_model/all_student_activities_model.dart';
import 'package:fehu_app/app/data/models/batches_model/batches_model.dart';
import 'package:fehu_app/app/data/models/student_activity_by_id_model/student_activity_by_id_model.dart';
import 'package:fehu_app/app/data/models/table_model/table_model.dart';
import 'package:retrofit/retrofit.dart';

import '../models/all_posts_model/all_posts_model.dart';
import '../models/departments_model/departments_model.dart';
import '../models/global_response_model.dart';
import '../models/login_response_model/login_response_model.dart';
part 'retrofit.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  /*--------------------------------------------------------------------------*/
  /*------------------------------  Register  --------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("api/auth/user/register")
  Future<GlobalResponseModel> postRegister(@Body() Map<String, dynamic> data);

  /*--------------------------------------------------------------------------*/
  /*-------------------------------  Login  ----------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("api/auth/user/login")
  Future<LoginResponseModel> postLogin(
      @Field("identifier") String username,
      @Field("password") String password,
      @Field("firebase_token") String firebaseTocken);

  /*--------------------------------------------------------------------------*/
  /*-----------------------------  Departments  ------------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("api/auth/user/departments")
  Future<DepartmentsModel> getDepartments();

  /*--------------------------------------------------------------------------*/
  /*------------------------------  All Posts  -------------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("api/auth/user/posts")
  Future<AllPostsModel> getAllPosts();

  /*--------------------------------------------------------------------------*/
  /*-----------------------  All Student Activities  -------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("api/auth/user/student-activities")
  Future<AllStudentActivitiesModel> getAllStudentActivities();

  /*--------------------------------------------------------------------------*/
  /*-----------------------  All Student Activities  -------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("api/auth/user/student-activities/{id}")
  Future<StudentActivityByIdModel> getStudentActivityBYId(@Path("id") int id);

  /*--------------------------------------------------------------------------*/
  /*-----------------------  All Student Activities  -------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("api/auth/admin/batches")
  Future<BatchesModel> getAllBatches();

  /*--------------------------------------------------------------------------*/
  /*-----------------------  All Student Activities  -------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("api/auth/user/tables/{id}")
  Future<TableModel> getTable(@Path("id") int id);
}
