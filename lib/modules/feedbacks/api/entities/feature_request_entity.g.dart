// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_request_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureRequestEntityData _$FeatureRequestEntityDataFromJson(Map json) =>
    FeatureRequestEntityData(
      id: json['id'] as String?,
      creationDate: DateTime.parse(json['creation_date'] as String),
      lastUpdateDate: DateTime.parse(json['last_update_date'] as String),
      title: Map<String, String>.from(json['title'] as Map),
      description: Map<String, String>.from(json['description'] as Map),
      votes: (json['votes'] as num).toInt(),
      active: json['active'] as bool,
    );

Map<String, dynamic> _$FeatureRequestEntityDataToJson(
  FeatureRequestEntityData instance,
) => <String, dynamic>{
  'id': instance.id,
  'creation_date': instance.creationDate.toIso8601String(),
  'last_update_date': instance.lastUpdateDate.toIso8601String(),
  'title': instance.title,
  'description': instance.description,
  'votes': instance.votes,
  'active': instance.active,
};
