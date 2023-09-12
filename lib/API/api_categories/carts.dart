import 'package:json_annotation/json_annotation.dart';


part 'carts.g.dart';
@JsonSerializable()
class Carts {
  final int? id;
  final int? userId;
  final DateTime? date;
  final List<Product>? products;

  Carts({
    this.id,
    this.userId,
    this.date,
    this.products,
  });
  factory Carts.fromJson(Map<String, dynamic> json) =>
      _$CartsFromJson(json);
  Map<String, dynamic> toJson() => _$CartsToJson(this);
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

