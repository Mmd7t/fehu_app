import 'post.dart';

class SAStudentActivity {
  int? id;
  String? name;
  String? excerpt;
  String? image;
  List<SAPost>? posts;

  SAStudentActivity({
    this.id,
    this.name,
    this.excerpt,
    this.image,
    this.posts,
  });

  factory SAStudentActivity.fromJson(Map<String, dynamic> json) {
    return SAStudentActivity(
      id: json['id'] as int?,
      name: json['name'] as String?,
      excerpt: json['excerpt'] as String?,
      image: json['image'] as String?,
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => SAPost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'excerpt': excerpt,
        'image': image,
        'posts': posts?.map((e) => e.toJson()).toList(),
      };
}
