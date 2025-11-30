import 'package:apparence_kit/core/shared_preferences/shared_preferences.dart';
import 'package:apparence_kit/services/lab_mode_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('LabModeService', () {
    late SharedPreferencesBuilder sharedPrefsBuilder;
    late LabModeService labModeService;

    setUp(() async {
      // Initialize SharedPreferences with empty values for testing
      SharedPreferences.setMockInitialValues({});
      sharedPrefsBuilder = SharedPreferencesBuilder();
      await sharedPrefsBuilder.init();
      labModeService = LabModeService(sharedPreferences: sharedPrefsBuilder);
    });

    test('initial state, isLabModeEnabled => should return false', () {
      // Lab mode should be disabled by default
      expect(labModeService.isLabModeEnabled, isFalse);
    });

    test('lab mode disabled, toggleLabMode => should enable and persist', () async {
      // Verify initial state
      expect(labModeService.isLabModeEnabled, isFalse);

      // Toggle lab mode on
      final result = await labModeService.toggleLabMode();

      // Verify result and persisted state
      expect(result, isTrue);
      expect(labModeService.isLabModeEnabled, isTrue);

      // Verify persistence by checking SharedPreferences directly
      final persistedValue = sharedPrefsBuilder.prefs.getBool('lab_mode_enabled');
      expect(persistedValue, isTrue);
    });

    test('lab mode enabled, toggleLabMode => should disable and persist', () async {
      // Enable lab mode first
      await labModeService.enableLabMode();
      expect(labModeService.isLabModeEnabled, isTrue);

      // Toggle lab mode off
      final result = await labModeService.toggleLabMode();

      // Verify result and persisted state
      expect(result, isFalse);
      expect(labModeService.isLabModeEnabled, isFalse);

      // Verify persistence
      final persistedValue = sharedPrefsBuilder.prefs.getBool('lab_mode_enabled');
      expect(persistedValue, isFalse);
    });

    test('enableLabMode => should set lab mode to true', () async {
      expect(labModeService.isLabModeEnabled, isFalse);

      await labModeService.enableLabMode();

      expect(labModeService.isLabModeEnabled, isTrue);
    });

    test('disableLabMode => should set lab mode to false', () async {
      await labModeService.enableLabMode();
      expect(labModeService.isLabModeEnabled, isTrue);

      await labModeService.disableLabMode();

      expect(labModeService.isLabModeEnabled, isFalse);
    });

    test('multiple toggles => should alternate state correctly', () async {
      expect(labModeService.isLabModeEnabled, isFalse);

      await labModeService.toggleLabMode();
      expect(labModeService.isLabModeEnabled, isTrue);

      await labModeService.toggleLabMode();
      expect(labModeService.isLabModeEnabled, isFalse);

      await labModeService.toggleLabMode();
      expect(labModeService.isLabModeEnabled, isTrue);
    });

    test('state persists across service instances', () async {
      // Enable lab mode
      await labModeService.enableLabMode();
      expect(labModeService.isLabModeEnabled, isTrue);

      // Create a new service instance with the same SharedPreferences
      final newLabModeService = LabModeService(
        sharedPreferences: sharedPrefsBuilder,
      );

      // Verify the state persisted
      expect(newLabModeService.isLabModeEnabled, isTrue);
    });
  });

  group('LabModeServiceFake', () {
    test('initial state false => isLabModeEnabled returns false', () {
      final fake = LabModeServiceFake(initialState: false);
      expect(fake.isLabModeEnabled, isFalse);
    });

    test('initial state true => isLabModeEnabled returns true', () {
      final fake = LabModeServiceFake(initialState: true);
      expect(fake.isLabModeEnabled, isTrue);
    });

    test('toggleLabMode => should toggle state', () async {
      final fake = LabModeServiceFake(initialState: false);

      final result = await fake.toggleLabMode();

      expect(result, isTrue);
      expect(fake.isLabModeEnabled, isTrue);
    });
  });
}

