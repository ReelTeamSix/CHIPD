// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium_page_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PremiumStateNotifier)
const premiumStateProvider = PremiumStateNotifierProvider._();

final class PremiumStateNotifierProvider
    extends $AsyncNotifierProvider<PremiumStateNotifier, PremiumState> {
  const PremiumStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'premiumStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$premiumStateNotifierHash();

  @$internal
  @override
  PremiumStateNotifier create() => PremiumStateNotifier();
}

String _$premiumStateNotifierHash() =>
    r'730b01b1d9d5c1797170b158f80d8bce259f6ecb';

abstract class _$PremiumStateNotifier extends $AsyncNotifier<PremiumState> {
  FutureOr<PremiumState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<PremiumState>, PremiumState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<PremiumState>, PremiumState>,
              AsyncValue<PremiumState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
