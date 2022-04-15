class Category {
  Category({this.image, required this.name, this.visible});

  String? image;
  String name;
  bool? visible;

  Category.fromJson(Map<String, Object?> json)
      : this(
            image: json['image']! as String,
            name: json['name']! as String,
            visible: json['visible']! as bool);

  Map<String, Object?> toJson() {
    return {'image': image, 'name': name, 'visible': visible};
  }
}
