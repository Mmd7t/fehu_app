class SAPost {
  int? id;
  String? title;
  String? author;
  String? body;
  String? image;
  dynamic video;
  String? album;
  String? publishingDate;
  int? studentActivityId;

  SAPost({
    this.id,
    this.title,
    this.author,
    this.body,
    this.image,
    this.video,
    this.album,
    this.publishingDate,
    this.studentActivityId,
  });

  factory SAPost.fromJson(Map<String, dynamic> json) => SAPost(
        id: json['id'] as int?,
        title: json['title'] as String?,
        author: json['author'] as String?,
        body: json['body'] as String?,
        image: json['image'] as String?,
        video: json['video'] as dynamic,
        album: json['album'] as String?,
        publishingDate: json['publishing_date'] as String?,
        studentActivityId: json['student_activity_id'] as int?,
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
      };
}
