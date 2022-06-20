import 'student_activity.dart';

class StudentActivityByIdModel {
  int? status;
  String? errorNum;
  String? message;
  SAStudentActivity? studentActivity;

  StudentActivityByIdModel({
    this.status,
    this.errorNum,
    this.message,
    this.studentActivity,
  });

  factory StudentActivityByIdModel.fromJson(Map<String, dynamic> json) {
    return StudentActivityByIdModel(
      status: json['status'] as int?,
      errorNum: json['errorNum'] as String?,
      message: json['message'] as String?,
      studentActivity: json['student_activity'] == null
          ? null
          : SAStudentActivity.fromJson(
              json['student_activity'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'errorNum': errorNum,
        'message': message,
        'student_activity': studentActivity?.toJson(),
      };
}
