import 'package:apparence_kit/core/data/models/lat_lng.dart';
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

  /// Developer's desk location for Lab Mode testing (Michigan)
  /// This coordinate is used as the mock GPS position when Lab Mode is enabled
  static const LatLng deskLocation = LatLng(42.808504031807246, -85.98755596334448);

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

  /// Returns the current location based on Lab Mode state.
  ///
  /// SECURITY/SAFETY: This method creates a clear separation between
  /// mock and real location data.
  ///
  /// - If Lab Mode is ENABLED: Returns [deskLocation] (mock coordinates)
  /// - If Lab Mode is DISABLED: Returns null (real GPS will be hooked up later)
  ///
  /// Consumers should check for null and fall back to real GPS when available.
  LatLng? getCurrentLocation() {
    if (isLabModeEnabled) {
      return deskLocation;
    }
    // Real GPS integration point - return null until GPS service is implemented
    return null;
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
  LatLng? getCurrentLocation() {
    if (_isEnabled) {
      return LabModeService.deskLocation;
    }
    return null;
  }

  @override
  SharedPreferencesBuilder get _sharedPreferences =>
      throw UnimplementedError('Fake does not use SharedPreferences');
}

