import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nimbus_cast/utilities/consts.dart';
import 'package:nimbus_cast/utilities/forecast_tile_provider.dart';
import 'package:weather/weather.dart';

class RealTime extends StatefulWidget {
  const RealTime({super.key});

  @override
  State<RealTime> createState() => RealTimeState();
}

class RealTimeState extends State<RealTime> {
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);

  Weather? _weather;
  late double lat;
  late double long;
  late CameraPosition initialPosition = const CameraPosition(
      target: LatLng(27.1894, 88.4978), // Default coordinates
      zoom: 14.4746);

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Set<TileOverlay> _tileOverlays = {};

  _initTiles() async {
    final String overLayId = DateTime.now().millisecondsSinceEpoch.toString();
    final tileOverLay = TileOverlay(
      tileOverlayId: TileOverlayId(overLayId),
      tileProvider: ForecastTileProvider(),
    );
    setState(
      () {
        _tileOverlays = {tileOverLay};
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _wf.currentWeatherByCityName("majitar").then(
      (w) {
        setState(
          () {
            _weather = w;
            if (_weather != null &&
                _weather!.latitude != null &&
                _weather!.longitude != null) {
              lat = _weather!.latitude!.toDouble();
              long = _weather!.longitude!.toDouble();
              initialPosition =
                  CameraPosition(target: LatLng(lat, long), zoom: 12.5);
            } else {
              // Handle the null case or set a default position
              // initialPosition = const CameraPosition(
              //     target: LatLng(27.1894, 88.4978), zoom: 14.4746);
              const CircularProgressIndicator();
            }
          },
        );
      },
    ).catchError(
      (error) {
        // Handle errors appropriately
        print('Error fetching weather data: $error');
        setState(
          () {
            initialPosition = const CameraPosition(
                target: LatLng(27.1894, 88.4978),
                zoom: 14.4746); // Fallback position
          },
        );
      },
    );
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    InitialPosition(initialPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _initTiles();
        },
        tileOverlays: _tileOverlays,
      ),
    );
  }

  Future<void> InitialPosition(CameraPosition cameraPosition) async {
    final GoogleMapController controller = await _controller.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
}


