import 'package:apparence_kit/core/data/api/base_api_exceptions.dart';
import 'package:apparence_kit/modules/feedbacks/api/entities/feature_request_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final featureRequestApiProvider = Provider<FeatureRequestApi>(
  (ref) => FeatureRequestApi(
    client: Supabase.instance.client,
  ),
);

const _kFeatureRequestTable = 'feature_requests';

class FeatureRequestApi {
  final SupabaseClient _client;

  FeatureRequestApi({
    required SupabaseClient client,
  }) : _client = client;

  Future<List<FeatureRequestEntity>> getAllActive() async {
    try {
      final res = await _client
          .from(_kFeatureRequestTable) //
          .select()
          .eq('active', true);
      if (res.isEmpty) {
        return [];
      }
      return res.map((e) => FeatureRequestEntity.fromJson(e)).toList();
    } catch (e, stacktrace) {
      Logger().e('$e: $stacktrace');
      throw ApiError(
        code: 0,
        message: '$e: $stacktrace',
      );
    }
  }
}
