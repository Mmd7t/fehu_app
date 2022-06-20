import 'table.dart';

class TableModel {
  int? status;
  String? errorNum;
  String? message;
  List<Table>? table;

  TableModel({this.status, this.errorNum, this.message, this.table});

  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
        status: json['status'] as int?,
        errorNum: json['errorNum'] as String?,
        message: json['message'] as String?,
        table: (json['table'] as List<dynamic>?)
            ?.map((e) => Table.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'errorNum': errorNum,
        'message': message,
        'table': table?.map((e) => e.toJson()).toList(),
      };
}
