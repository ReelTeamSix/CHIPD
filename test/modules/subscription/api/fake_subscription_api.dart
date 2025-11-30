import 'package:apparence_kit/modules/subscription/api/entities/subscription_entity.dart';
import 'package:apparence_kit/modules/subscription/api/subscription_api.dart';

class SubscriptionApiFake implements SubscriptionApi {
  SubscriptionEntity? currentFake;

  @override
  Future<SubscriptionEntity?> get(String userId) {
    return Future(() => currentFake);
  }
}
