import 'package:json_annotation/json_annotation.dart';
part 'categories.g.dart';
@JsonSerializable()
class Categories {
  @JsonKey()
  final int? id;
  @JsonKey()
  final String? name;
  @JsonKey()
  final String? image;
  @JsonKey()
  final DateTime? creationAt;
  @JsonKey()
  final DateTime? updatedAt;

  Categories({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });
  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesToJson(this);

}
