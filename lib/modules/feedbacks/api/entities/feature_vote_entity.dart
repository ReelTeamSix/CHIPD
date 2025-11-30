// ignore: depend_on_referenced_packages
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_vote_entity.freezed.dart';
part 'feature_vote_entity.g.dart';

@freezed
abstract class UserFeatureVoteEntity with _$UserFeatureVoteEntity {
  const factory UserFeatureVoteEntity({
    @JsonKey() String? id,
    @JsonKey(name: 'creation_date') required DateTime creationDate,
    @JsonKey(name: 'user_uid') required String userId,
    @JsonKey(name: 'feature_id') required String featureId,
  }) = UserFeatureVoteEntityData;

  const UserFeatureVoteEntity._();

  factory UserFeatureVoteEntity.fromJson(Map<String, dynamic> json) =>
      _$UserFeatureVoteEntityFromJson(json);
}
