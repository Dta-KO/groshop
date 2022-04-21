class Category {
  Category(
      {this.id, this.position, this.image, required this.name, this.visible});

  int? position;
  String? id;
  String? image;
  String name;
  bool? visible;

  Category.fromJson(Map<String, Object?> json)
      : this(
            image: json['image']! as String,
            name: json['name']! as String,
            visible: json['visible']! as bool,
            id: json['id'] as String,
            position: json['position'] as int);

  Map<String, Object?> toJson() {
    return {
      'image': image,
      'name': name,
      'visible': visible,
      'id': id,
      'position': position
    };
  }
}
