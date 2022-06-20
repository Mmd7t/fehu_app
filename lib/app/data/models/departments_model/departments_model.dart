import 'department.dart';

class DepartmentsModel {
  int? status;
  String? errorNum;
  String? message;
  List<Department>? departments;

  DepartmentsModel({
    this.status,
    this.errorNum,
    this.message,
    this.departments,
  });

  factory DepartmentsModel.fromJson(Map<String, dynamic> json) {
    return DepartmentsModel(
      status: json['status'] as int?,
      errorNum: json['errorNum'] as String?,
      message: json['message'] as String?,
      departments: (json['departments'] as List<dynamic>?)
          ?.map((e) => Department.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'errorNum': errorNum,
        'message': message,
        'departments': departments?.map((e) => e.toJson()).toList(),
      };
}
