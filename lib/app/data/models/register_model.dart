class RegisterRequestModel {
  String? fullName;
  String? username;
  String? email;
  String? phone;
  String? password;
  String? section;
  String? academicYear;
  int? departmentId;
  int? batchId;

  RegisterRequestModel({
    this.fullName,
    this.username,
    this.email,
    this.phone,
    this.password,
    this.section,
    this.academicYear,
    this.departmentId,
    this.batchId,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return RegisterRequestModel(
      fullName: json['full_name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      section: json['section'] as String?,
      departmentId: json['department_id'] as int?,
      batchId: json['batch_id'] as int?,
      academicYear: json['academic_year'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'full_name': fullName,
        'username': username,
        'email': email,
        'phone': phone,
        'password': password,
        'section': section,
        'department_id': departmentId,
        'batch_id': batchId,
        'academic_year': academicYear,
      };
}
