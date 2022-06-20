class StudentActivity {
  int? id;
  String? name;
  String? excerpt;
  String? image;

  StudentActivity({this.id, this.name, this.excerpt, this.image});

  factory StudentActivity.fromJson(Map<String, dynamic> json) {
    return StudentActivity(
      id: json['id'] as int?,
      name: json['name'] as String?,
      excerpt: json['excerpt'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'excerpt': excerpt,
        'image': image,
      };
}
