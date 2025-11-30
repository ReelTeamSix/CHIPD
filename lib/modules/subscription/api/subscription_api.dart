import 'package:apparence_kit/core/data/api/base_api_exceptions.dart';
import 'package:apparence_kit/modules/subscription/api/entities/subscription_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final subscriptionApiProvider = Provider(
  (ref) => SubscriptionApi(
    client: Supabase.instance.client,
  ),
);

/// Subscription API
/// Your backend should handle a webhook from the payment provider
/// to update the subscription status
/// Don't save the subscription status in the app,
/// always do this from a webhook call between you backend and the payment provider
class SubscriptionApi {
  final SupabaseClient _client;
  final Logger _logger = Logger();

  SubscriptionApi({
    required SupabaseClient client,
  }) : _client = client;

  Future<SubscriptionEntity?> get(String userId) async {
    try {
      final res = await _client
          .from('subscriptions') //
          .select()
          .eq('user_id', userId);
      if (res.isEmpty) {
        return null;
      }
      return SubscriptionEntity.fromJson(res.first);
    } catch (e) {
      _logger.e(e);
      throw ApiError(
        code: 0,
        message: '$e',
      );
    }
  }
}
