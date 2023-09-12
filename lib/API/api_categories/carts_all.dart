import 'package:json_annotation/json_annotation.dart';
part 'carts_all.g.dart';
@JsonSerializable()
class CartsAll {
  final int? id;
  final int? userId;
  final DateTime? date;
  final List<Product>? products;
  final int? v;

  CartsAll({
    this.id,
    this.userId,
    this.date,
    this.products,
    this.v,
  });
  factory CartsAll.fromJson(Map<String, dynamic> json) =>
      _$CartsAllFromJson(json);
  Map<String, dynamic> toJson() => _$CartsAllToJson(this);
}
@JsonSerializable()
class Product {
  final int? productId;
  final int? quantity;

  Product({
    this.productId,
    this.quantity,
  });
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
