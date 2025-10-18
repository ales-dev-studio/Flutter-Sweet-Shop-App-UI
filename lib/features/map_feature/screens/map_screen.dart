import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/flutter_map_widget.dart';
import '../../../core/widgets/general_app_bar.dart';
import '../widgets/stores_on_map_screen.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: GeneralAppBar(title: 'Map', showBackIcon: false),
      padding: EdgeInsets.zero,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FlutterMapWidget(latLng: LatLng(25.201723, 55.262675)),
          StoresOnMapScreen(),
        ],
      ),
    );
  }
}
