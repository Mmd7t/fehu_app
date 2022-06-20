import 'data.dart';

class LoginResponseModel {
  int? status;
  String? errorNum;
  String? message;
  Data? data;

  LoginResponseModel({this.status, this.errorNum, this.message, this.data});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'] as int?,
      errorNum: json['errorNum'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'errorNum': errorNum,
        'message': message,
        'data': data?.toJson(),
      };
}
