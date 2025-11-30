import 'package:apparence_kit/core/data/models/lat_lng.dart';
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

    test('lab mode enabled, getCurrentLocation => should return deskLocation', () async {
      // Enable lab mode
      await labModeService.enableLabMode();
      expect(labModeService.isLabModeEnabled, isTrue);

      // Get current location
      final location = labModeService.getCurrentLocation();

      // Verify it returns the exact desk coordinates
      expect(location, isNotNull);
      expect(location, equals(LabModeService.deskLocation));
      expect(location!.latitude, equals(42.808504031807246));
      expect(location.longitude, equals(-85.98755596334448));
    });

    test('lab mode disabled, getCurrentLocation => should return null', () {
      // Verify lab mode is disabled
      expect(labModeService.isLabModeEnabled, isFalse);

      // Get current location
      final location = labModeService.getCurrentLocation();

      // Verify it returns null (real GPS hook point)
      expect(location, isNull);
    });

    test('deskLocation constant => should have correct coordinates', () {
      // Verify the desk location constant is correctly defined
      expect(LabModeService.deskLocation.latitude, equals(42.808504031807246));
      expect(LabModeService.deskLocation.longitude, equals(-85.98755596334448));
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

    test('initial state true, getCurrentLocation => should return deskLocation', () {
      final fake = LabModeServiceFake(initialState: true);

      final location = fake.getCurrentLocation();

      expect(location, isNotNull);
      expect(location, equals(LabModeService.deskLocation));
      expect(location!.latitude, equals(42.808504031807246));
      expect(location.longitude, equals(-85.98755596334448));
    });

    test('initial state false, getCurrentLocation => should return null', () {
      final fake = LabModeServiceFake(initialState: false);

      final location = fake.getCurrentLocation();

      expect(location, isNull);
    });
  });
}

