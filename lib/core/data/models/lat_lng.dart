/// Represents a geographical coordinate with latitude and longitude.
///
/// This is a simple immutable class that can be used for location coordinates
/// throughout the app. When google_maps_flutter is added, this can be easily
/// replaced with the package's LatLng class if needed.
class LatLng {
  final double latitude;
  final double longitude;

  const LatLng(this.latitude, this.longitude);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LatLng &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;

  @override
  String toString() => 'LatLng($latitude, $longitude)';
}

