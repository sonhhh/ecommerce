import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  Products({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}



// extension CategoryExtension on Category {
//   String get value {
//     switch (this) {
//       case Category.ELECTRONICS:
//         return "electronics";
//       case Category.JEWELERY:
//         return "jewelery";
//       case Category.MEN_S_CLOTHING:
//         return "men's_clothing";
//       case Category.WOMEN_S_CLOTHING:
//         return "women's_clothing";
//     }
//   }
// }


@JsonSerializable()
class Rating {
  final double? rate;
  final int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
// class Products {
//   @JsonKey()
//   final int? id;
//   @JsonKey()
//   final String? title;
//   @JsonKey()
//   final int? price;
//   @JsonKey()
//   final String? description;
//   @JsonKey()
//   final List<String>? images;
//   @JsonKey()
//   final DateTime? creationAt;
//   @JsonKey()
//   final DateTime? updatedAt;
//   @JsonKey()
//   final Category? category;
//
//   Products({
//     this.id,
//     this.title,
//     this.price,
//     this.description,
//     this.images,
//     this.creationAt,
//     this.updatedAt,
//     this.category,
//   });
//   factory Products.fromJson(Map<String, dynamic> json) =>
//       _$ProductsFromJson(json);
//   Map<String, dynamic> toJson() => _$ProductsToJson(this);
// }
// @JsonSerializable()
// class Category {
//   @JsonKey()
//   final int? id;
//   @JsonKey()
//   final String? name;
//   @JsonKey()
//   final String? image;
//   @JsonKey()
//   final DateTime? creationAt;
//   @JsonKey()
//   final DateTime? updatedAt;
//
//   Category({
//     this.id,
//     this.name,
//     this.image,
//     this.creationAt,
//     this.updatedAt,
//   });
//   factory Category.fromJson(Map<String, dynamic> json) =>
//       _$CategoryFromJson(json);
//   Map<String, dynamic> toJson() => _$CategoryToJson(this);
// }
//
// enum Name {
//   CLOTHES,
//   ELECTRONICS,
//   OTHERS,
//   SHOES,
//   VENUS_IS_A_SUCESSFUL_PROGRAMMER
// }
// extension NameExtension on Name {
//   String get value {
//     switch (this) {
//       case Name.CLOTHES:
//         return "Clothes";
//       case Name.ELECTRONICS:
//         return "Electronics";
//       case Name.OTHERS:
//         return "Others";
//       case Name.SHOES:
//         return "shoes";
//       case Name.VENUS_IS_A_SUCESSFUL_PROGRAMMER:
//         return "Venus is a successful programmer";
//     }
//   }
// }
// class NameMapper {
//   static final Map<String, Name> stringToEnum = {
//     'Clothes': Name.CLOTHES,
//     'Electronics': Name.ELECTRONICS,
//     'Others': Name.OTHERS,
//     'shoes': Name.SHOES,
//     'Venus is a successful programmer': Name.VENUS_IS_A_SUCESSFUL_PROGRAMMER,
//   };
//}
