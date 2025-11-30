// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_page_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FeedbackPageNotifier)
const feedbackPageProvider = FeedbackPageNotifierProvider._();

final class FeedbackPageNotifierProvider
    extends $AsyncNotifierProvider<FeedbackPageNotifier, FeebackPageState> {
  const FeedbackPageNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedbackPageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedbackPageNotifierHash();

  @$internal
  @override
  FeedbackPageNotifier create() => FeedbackPageNotifier();
}

String _$feedbackPageNotifierHash() =>
    r'68659dc9a54be96306657069ac442fe960fc84fe';

abstract class _$FeedbackPageNotifier extends $AsyncNotifier<FeebackPageState> {
  FutureOr<FeebackPageState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<FeebackPageState>, FeebackPageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<FeebackPageState>, FeebackPageState>,
              AsyncValue<FeebackPageState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
