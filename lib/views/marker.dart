class Markers {
  late double latitude;
  late double longitude;

  Markers(
      {required this.latitude, required this.longitude});

  Markers.fromJson(Map data, value) {
    latitude = data['lat'];
    longitude = data['long'];
  }
}