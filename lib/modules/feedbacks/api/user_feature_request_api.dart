import 'package:apparence_kit/core/data/api/base_api_exceptions.dart';
import 'package:apparence_kit/modules/feedbacks/api/entities/user_feature_request_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final userFeatureRequestApiProvider = Provider<UserFeatureRequestApi>(
  (ref) => UserFeatureRequestApi(
    client: Supabase.instance.client,
  ),
);

const _kFeatureRequestTable = 'awaiting_feature_requests';

class UserFeatureRequestApi {
  final SupabaseClient _client;

  UserFeatureRequestApi({
    required SupabaseClient client,
  }) : _client = client;

  Future<void> create(UserFeatureRequestEntity userFeatureRequest) async {
    try {
      await _client
          .from(_kFeatureRequestTable)
          .upsert(userFeatureRequest.toJson()..remove('id'));
    } catch (e, stacktrace) {
      Logger().e('$e: $stacktrace');
      throw ApiError(
        code: 0,
        message: '$e: $stacktrace',
      );
    }
  }
}
