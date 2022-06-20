class Table {
  String? startTime;
  String? endTime;
  String? subject;
  String? day;
  String? location;

  Table({this.startTime, this.endTime, this.subject, this.location, this.day});

  factory Table.fromJson(Map<String, dynamic> json) => Table(
        startTime: json['start_time'] as String?,
        endTime: json['end_time'] as String?,
        subject: json['subject'] as String?,
        day: json['day'] as String?,
        location: json['location'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'start_time': startTime,
        'end_time': endTime,
        'subject': subject,
        'day': day,
        'location': location,
      };
}
