// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carts_all.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartsAll _$CartsAllFromJson(Map<String, dynamic> json) => CartsAll(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      v: json['v'] as int?,
    );

Map<String, dynamic> _$CartsAllToJson(CartsAll instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date?.toIso8601String(),
      'products': instance.products,
      'v': instance.v,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productId: json['productId'] as int?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
    };
