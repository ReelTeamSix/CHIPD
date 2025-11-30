import 'package:apparence_kit/core/initializer/onstart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remoteConfigApiProvider = Provider<RemoteConfigApi>(
  (ref) {
    // Stub implementation - Firebase Remote Config removed for MVP
    // Add Firebase Remote Config back post-MVP if needed
    return StubRemoteConfigApi();
  },
);

/// RemoteConfigApi
/// This is a stub implementation for MVP development.
/// Firebase Remote Config was removed to simplify the build process.
///
/// To add Firebase Remote Config later:
/// 1. Add firebase_core and firebase_remote_config to pubspec.yaml
/// 2. Run flutterfire configure
/// 3. Replace StubRemoteConfigApi with the Firebase implementation
abstract class RemoteConfigApi implements OnStartService {
  Stream<OnKeyChanged> onKeyChanged();
}

/// Stub implementation that does nothing
/// Use this during MVP development without Firebase
class StubRemoteConfigApi implements RemoteConfigApi {
  @override
  Future<void> init() async {
    // No-op: Firebase Remote Config not configured
  }

  @override
  Stream<OnKeyChanged> onKeyChanged() {
    // Return empty stream - no config updates
    return const Stream.empty();
  }
}

/// This will be used to notify the app that a key has changed
typedef OnKeyChanged = void Function();
