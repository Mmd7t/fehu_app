import 'department.dart';

class Batch {
  int? id;
  int? departmentId;
  String? academicYear;
  String? driveLink;
  int? number;
  Department? department;

  Batch({
    this.id,
    this.departmentId,
    this.academicYear,
    this.driveLink,
    this.number,
    this.department,
  });

  factory Batch.fromJson(Map<String, dynamic> json) => Batch(
        id: json['id'] as int?,
        departmentId: json['department_id'] as int?,
        academicYear: json['academic_year'] as String?,
        driveLink: json['drive_link'] as String?,
        number: json['number'] as int?,
        department: json['department'] == null
            ? null
            : Department.fromJson(json['department'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'department_id': departmentId,
        'academic_year': academicYear,
        'drive_link': driveLink,
        'number': number,
        'department': department?.toJson(),
      };
}
