// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_feature_request_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFeatureRequestEntityData _$UserFeatureRequestEntityDataFromJson(Map json) =>
    UserFeatureRequestEntityData(
      id: json['id'] as String?,
      creationDate: DateTime.parse(json['creation_date'] as String),
      title: json['title'] as String,
      description: json['description'] as String,
      userId: json['user_uid'] as String,
    );

Map<String, dynamic> _$UserFeatureRequestEntityDataToJson(
  UserFeatureRequestEntityData instance,
) => <String, dynamic>{
  'id': instance.id,
  'creation_date': instance.creationDate.toIso8601String(),
  'title': instance.title,
  'description': instance.description,
  'user_uid': instance.userId,
};
