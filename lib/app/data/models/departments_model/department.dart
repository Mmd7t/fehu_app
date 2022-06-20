class Department {
  int? id;
  String? title;
  String? image;

  Department({this.id, this.title, this.image});

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json['id'] as int?,
        title: json['title'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
      };
}
