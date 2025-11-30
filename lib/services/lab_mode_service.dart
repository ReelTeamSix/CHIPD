import 'package:apparence_kit/core/shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provider for LabModeService
/// Depends on SharedPreferencesBuilder to persist state
final labModeServiceProvider = Provider<LabModeService>(
  (ref) => LabModeService(
    sharedPreferences: ref.read(sharedPreferencesProvider),
  ),
);

/// Service to manage Lab Mode state
/// Lab Mode allows developers to test the app without being on a golf course
/// by using mock GPS coordinates and simulated NFC taps
///
/// IMPORTANT: This should NEVER be enabled in production builds
/// Use this for desk testing during development (e.g., Michigan winter)
class LabModeService {
  static const String _labModeKey = 'lab_mode_enabled';

  final SharedPreferencesBuilder _sharedPreferences;

  LabModeService({
    required SharedPreferencesBuilder sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  /// Returns whether Lab Mode is currently enabled
  bool get isLabModeEnabled {
    return _sharedPreferences.prefs.getBool(_labModeKey) ?? false;
  }

  /// Toggles Lab Mode on/off
  /// Returns the new state after toggling
  Future<bool> toggleLabMode() async {
    final newValue = !isLabModeEnabled;
    await _sharedPreferences.prefs.setBool(_labModeKey, newValue);
    return newValue;
  }

  /// Explicitly enable Lab Mode
  Future<void> enableLabMode() async {
    await _sharedPreferences.prefs.setBool(_labModeKey, true);
  }

  /// Explicitly disable Lab Mode
  Future<void> disableLabMode() async {
    await _sharedPreferences.prefs.setBool(_labModeKey, false);
  }
}

/// A fake implementation for testing
/// Allows tests to control Lab Mode state without SharedPreferences
class LabModeServiceFake implements LabModeService {
  bool _isEnabled;

  LabModeServiceFake({bool initialState = false}) : _isEnabled = initialState;

  @override
  bool get isLabModeEnabled => _isEnabled;

  @override
  Future<bool> toggleLabMode() async {
    _isEnabled = !_isEnabled;
    return _isEnabled;
  }

  @override
  Future<void> enableLabMode() async {
    _isEnabled = true;
  }

  @override
  Future<void> disableLabMode() async {
    _isEnabled = false;
  }

  @override
  SharedPreferencesBuilder get _sharedPreferences =>
      throw UnimplementedError('Fake does not use SharedPreferences');
}

