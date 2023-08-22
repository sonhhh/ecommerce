// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      creationAt: json['creationAt'] == null
          ? null
          : DateTime.parse(json['creationAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'creationAt': instance.creationAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
