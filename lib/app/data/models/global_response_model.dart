class GlobalResponseModel {
  int? status;
  String? message;
  String? errorNum;

  GlobalResponseModel({this.status, this.message, this.errorNum});

  factory GlobalResponseModel.fromJson(Map<String, dynamic> json) {
    return GlobalResponseModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      errorNum: json['errorNum'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'errorNum': errorNum,
      };
}
