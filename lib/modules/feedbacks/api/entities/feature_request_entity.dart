// ignore: depend_on_referenced_packages
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_request_entity.freezed.dart';
part 'feature_request_entity.g.dart';

@freezed
sealed class FeatureRequestEntity with _$FeatureRequestEntity {
  const factory FeatureRequestEntity({
    @JsonKey() String? id,
    @JsonKey(name: "creation_date") required DateTime creationDate,
    @JsonKey(name: "last_update_date") required DateTime lastUpdateDate,
    required Map<String, String> title,
    required Map<String, String> description,
    required int votes,
    required bool active, // votes are enabled for this feature
  }) = FeatureRequestEntityData;

  const FeatureRequestEntity._();

  factory FeatureRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$FeatureRequestEntityFromJson(json);
}
