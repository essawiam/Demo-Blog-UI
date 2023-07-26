class HomeBlogModel {
  final int id;
  final String title;
  final String imageUrl;
  final String subTitle;
  final String description;

  HomeBlogModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.subTitle,
    required this.description,
  });

  HomeBlogModel copyWith({
    int? id,
    String? title,
    String? imageUrl,
    String? subTitle,
    String? description,
  }) {
    return HomeBlogModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      subTitle: subTitle ?? this.subTitle,
      description: description ?? this.description,
    );
  }
}
