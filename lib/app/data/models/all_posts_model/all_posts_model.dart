import 'post.dart';

class AllPostsModel {
  int? status;
  String? errorNum;
  String? message;
  List<Post>? posts;

  AllPostsModel({this.status, this.errorNum, this.message, this.posts});

  factory AllPostsModel.fromJson(Map<String, dynamic> json) => AllPostsModel(
        status: json['status'] as int?,
        errorNum: json['errorNum'] as String?,
        message: json['message'] as String?,
        posts: (json['posts'] as List<dynamic>?)
            ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'errorNum': errorNum,
        'message': message,
        'posts': posts?.map((e) => e.toJson()).toList(),
      };
}
