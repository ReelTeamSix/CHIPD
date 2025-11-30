import 'package:apparence_kit/core/data/api/base_api_exceptions.dart';
import 'package:apparence_kit/modules/feedbacks/api/entities/feature_vote_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final featureVoteApiProvider = Provider<FeatureVoteApi>(
  (ref) => FeatureVoteApi(
    client: Supabase.instance.client,
  ),
);

const _kFeatureVoteTable = 'feature_votes';

class FeatureVoteApi {
  final SupabaseClient _client;

  FeatureVoteApi({
    required SupabaseClient client,
  }) : _client = client;

  Future<List<UserFeatureVoteEntity>> getUserVotes(String userId) async {
    try {
      final res = await _client
          .from(_kFeatureVoteTable)
          .select()
          .eq('user_uid', userId);
      if (res.isEmpty) {
        return [];
      }
      return res.map((e) => UserFeatureVoteEntity.fromJson(e)).toList();
    } catch (e, stacktrace) {
      Logger().e('$e: $stacktrace');
      throw ApiError(
        code: 0,
        message: '$e: $stacktrace',
      );
    }
  }

  Future<UserFeatureVoteEntity> create(String userId, String featureId) async {
    try {
      final res = await _client
          .from(_kFeatureVoteTable)
          .upsert(
            UserFeatureVoteEntity(
              creationDate: DateTime.now(),
              userId: userId,
              featureId: featureId,
            ).toJson()
              ..remove('id'),
          )
          .select();
      if (res.isEmpty) {
        throw ApiError(
          code: 0,
          message: 'Failed to create vote',
        );
      }
      return UserFeatureVoteEntity.fromJson(res.first);
    } catch (e, stacktrace) {
      Logger().e('$e: $stacktrace');
      throw ApiError(
        code: 0,
        message: '$e: $stacktrace',
      );
    }
  }

  Future<void> delete(String featureId, String voteId) async {
    try {
      await _client
          .from(_kFeatureVoteTable)
          .delete()
          .eq('id', voteId)
          .eq('feature_id', featureId);
    } catch (e, stacktrace) {
      Logger().e('$e: $stacktrace');
      throw ApiError(
        code: 0,
        message: '$e: $stacktrace',
      );
    }
  }
}
