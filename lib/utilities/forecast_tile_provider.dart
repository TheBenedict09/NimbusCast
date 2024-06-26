import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:nimbus_cast/utilities/consts.dart';

class ForecastTileProvider implements TileProvider {
  @override
  Future<Tile> getTile(int x, int y, int? zoom) async {
    Uint8List tileBytes = Uint8List(0);
    try {
      final url =
          "https://api.tomorrow.io/v4/weather/forecast?location=42.3478,-71.0466&apikey=nt5N8qRVPwvoLsuUzLmcEG4thPC1y1VC";
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      print(x);
      if (response.statusCode == 200) {
        tileBytes = response.bodyBytes;
      } else {
        throw Exception(
            'Failed to load tile with status code ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    }
    return Tile(256, 256, tileBytes);
  }
}
