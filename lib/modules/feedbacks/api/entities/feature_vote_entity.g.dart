// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_vote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFeatureVoteEntityData _$UserFeatureVoteEntityDataFromJson(Map json) =>
    UserFeatureVoteEntityData(
      id: json['id'] as String?,
      creationDate: DateTime.parse(json['creation_date'] as String),
      userId: json['user_uid'] as String,
      featureId: json['feature_id'] as String,
    );

Map<String, dynamic> _$UserFeatureVoteEntityDataToJson(
  UserFeatureVoteEntityData instance,
) => <String, dynamic>{
  'id': instance.id,
  'creation_date': instance.creationDate.toIso8601String(),
  'user_uid': instance.userId,
  'feature_id': instance.featureId,
};
