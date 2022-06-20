// import 'table.dart';
import '../table_model/table.dart';
import 'token_data.dart';

class Data {
  int? id;
  String? username;
  String? fullName;
  String? email;
  String? phone;
  int? section;
  String? academicYear;
  int? departmentId;
  TokenData? tokenData;
  List<Table>? table;
  dynamic image;
  DriveLinks? driveLinks;

  Data({
    this.id,
    this.username,
    this.fullName,
    this.email,
    this.phone,
    this.section,
    this.academicYear,
    this.departmentId,
    this.tokenData,
    this.table,
    this.image,
    this.driveLinks,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        username: json['username'] as String?,
        fullName: json['full_name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        section: json['section'] as int?,
        academicYear: json['academic_year'] as String?,
        departmentId: json['department_id'] as int?,
        driveLinks: json["drive_links"] == null
            ? null
            : DriveLinks.fromJson(json["drive_links"]),
        tokenData: json['token_data'] == null
            ? null
            : TokenData.fromJson(json['token_data'] as Map<String, dynamic>),
        table: (json['table'] as List<dynamic>?)
            ?.map((e) => Table.fromJson(e as Map<String, dynamic>))
            .toList(),
        image: json['image'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'full_name': fullName,
        'email': email,
        'phone': phone,
        'section': section,
        'academic_year': academicYear,
        'department_id': departmentId,
        'token_data': tokenData?.toJson(),
        'table': table?.map((e) => e.toJson()).toList(),
        'image': image,
        'drive_links': driveLinks,
      };
}

class DriveLinks {
  DriveLinks({
    this.driveLink0,
    this.driveLink1,
    this.driveLink2,
    this.driveLink3,
    this.driveLink4,
  });

  final String? driveLink0;
  final String? driveLink1;
  final String? driveLink2;
  final String? driveLink3;
  final String? driveLink4;

  factory DriveLinks.fromJson(Map<String, dynamic> json) => DriveLinks(
        driveLink0:
            json["drive_link_0"] == null ? '' : json["drive_link_0"] as String?,
        driveLink1:
            json["drive_link_1"] == null ? '' : json["drive_link_1"] as String?,
        driveLink2:
            json["drive_link_2"] == null ? '' : json["drive_link_2"] as String?,
        driveLink3:
            json["drive_link_3"] == null ? '' : json["drive_link_3"] as String?,
        driveLink4:
            json["drive_link_4"] == null ? '' : json["drive_link_4"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "drive_link_0": driveLink0,
        "drive_link_1": driveLink1,
        "drive_link_2": driveLink2,
        "drive_link_3": driveLink3,
        "drive_link_4": driveLink4,
      };
}
