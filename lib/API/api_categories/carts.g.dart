// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Carts _$CartsFromJson(Map<String, dynamic> json) => Carts(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartsToJson(Carts instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date?.toIso8601String(),
      'products': instance.products,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productId: json['productId'] as int?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
    };
