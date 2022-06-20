import 'batch.dart';

class BatchesModel {
  int? status;
  String? errorNum;
  String? message;
  List<Batch>? batches;

  BatchesModel({this.status, this.errorNum, this.message, this.batches});

  factory BatchesModel.fromJson(Map<String, dynamic> json) => BatchesModel(
        status: json['status'] as int?,
        errorNum: json['errorNum'] as String?,
        message: json['message'] as String?,
        batches: (json['batches'] as List<dynamic>?)
            ?.map((e) => Batch.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'errorNum': errorNum,
        'message': message,
        'batches': batches?.map((e) => e.toJson()).toList(),
      };
}
