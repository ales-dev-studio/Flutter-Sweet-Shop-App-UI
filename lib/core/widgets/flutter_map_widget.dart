import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_sweet_shop_app_ui/core/theme/theme.dart';
import 'package:latlong2/latlong.dart';

class FlutterMapWidget extends StatelessWidget {
  const FlutterMapWidget({super.key, required this.latLng, this.mapController});

  final LatLng latLng;
  final MapController? mapController;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(initialCenter: latLng, initialZoom: 17),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
          userAgentPackageName: 'com.sweet.shop.flutter_sweet_shop_app_ui',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: latLng,
              width: 40,
              height: 40,
              child: Icon(
                Icons.location_pin,
                color: context.theme.appColors.primary,
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
