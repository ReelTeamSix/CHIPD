// ignore: depend_on_referenced_packages
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_feature_request_entity.freezed.dart';
part 'user_feature_request_entity.g.dart';

@freezed
abstract class UserFeatureRequestEntity with _$UserFeatureRequestEntity {
  const factory UserFeatureRequestEntity({
    @JsonKey() String? id,
    @JsonKey(name: 'creation_date') required DateTime creationDate,
    required String title,
    required String description,
    @JsonKey(name: 'user_uid') required String userId,
  }) = UserFeatureRequestEntityData;

  const UserFeatureRequestEntity._();

  factory UserFeatureRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$UserFeatureRequestEntityFromJson(json);
}
