import '../all_student_activities_model/student_activity.dart';

class Post {
  int? id;
  String? title;
  String? author;
  String? body;
  dynamic image;
  dynamic video;
  String? album;
  String? publishingDate;
  int? studentActivityId;
  StudentActivity? studentActivity;

  Post({
    this.id,
    this.title,
    this.author,
    this.body,
    this.image,
    this.video,
    this.album,
    this.publishingDate,
    this.studentActivityId,
    this.studentActivity,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['id'] as int?,
        title: json['title'] as String?,
        author: json['author'] as String?,
        body: json['body'] as String?,
        image: json['image'] as dynamic,
        video: json['video'] as dynamic,
        album: json['album'] as String?,
        publishingDate: json['publishing_date'] as String?,
        studentActivityId: json['student_activity_id'] as int?,
        studentActivity: json['student_activity'] == null
            ? null
            : StudentActivity.fromJson(
                json['student_activity'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'author': author,
        'body': body,
        'image': image,
        'video': video,
        'album': album,
        'publishing_date': publishingDate,
        'student_activity_id': studentActivityId,
        'student_activity': studentActivity?.toJson(),
      };
}
