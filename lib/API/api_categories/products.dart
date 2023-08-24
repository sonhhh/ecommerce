import 'package:json_annotation/json_annotation.dart';
part 'products.g.dart';
@JsonSerializable()
class Products {
  @JsonKey()
  final int? id;
  @JsonKey()
  final String? title;
  @JsonKey()
  final int? price;
  @JsonKey()
  final String? description;
  @JsonKey()
  final List<String>? images;
  @JsonKey()
  final DateTime? creationAt;
  @JsonKey()
  final DateTime? updatedAt;
  @JsonKey()
  final Category? category;

  Products({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });
  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
@JsonSerializable()
class Category {
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

  Category({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

enum Name {
  CLOTHES,
  ELECTRONICS,
  OTHERS,
  SHOES,
  VENUS_IS_A_SUCESSFUL_PROGRAMMER
}
extension NameExtension on Name {
  String get value {
    switch (this) {
      case Name.CLOTHES:
        return "Clothes";
      case Name.ELECTRONICS:
        return "Electronics";
      case Name.OTHERS:
        return "Others";
      case Name.SHOES:
        return "shoes";
      case Name.VENUS_IS_A_SUCESSFUL_PROGRAMMER:
        return "Venus is a successful programmer";
    }
  }
}
// class NameMapper {
//   static final Map<String, Name> stringToEnum = {
//     'Clothes': Name.CLOTHES,
//     'Electronics': Name.ELECTRONICS,
//     'Others': Name.OTHERS,
//     'shoes': Name.SHOES,
//     'Venus is a successful programmer': Name.VENUS_IS_A_SUCESSFUL_PROGRAMMER,
//   };
//}