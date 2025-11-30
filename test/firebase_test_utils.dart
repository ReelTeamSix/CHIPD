import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

typedef Callback = void Function(MethodCall call);

/// Stub Firebase test utils - Firebase was removed for MVP
/// This file is kept for compatibility but does nothing.
///
/// To restore Firebase testing later:
/// 1. Add firebase_core to pubspec.yaml
/// 2. Restore the Firebase initialization code
Future<void> initFirebaseForTest([int? counter]) async {
  // No-op: Firebase not configured for MVP
}

void setupFirebaseAuthMocks([Callback? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();
}
