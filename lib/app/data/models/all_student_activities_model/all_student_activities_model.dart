import 'student_activity.dart';

class AllStudentActivitiesModel {
  int? status;
  String? errorNum;
  String? message;
  List<StudentActivity>? studentActivities;

  AllStudentActivitiesModel({
    this.status,
    this.errorNum,
    this.message,
    this.studentActivities,
  });

  factory AllStudentActivitiesModel.fromJson(Map<String, dynamic> json) {
    return AllStudentActivitiesModel(
      status: json['status'] as int?,
      errorNum: json['errorNum'] as String?,
      message: json['message'] as String?,
      studentActivities: (json['student_activities'] as List<dynamic>?)
          ?.map((e) => StudentActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'errorNum': errorNum,
        'message': message,
        'student_activities':
            studentActivities?.map((e) => e.toJson()).toList(),
      };
}
