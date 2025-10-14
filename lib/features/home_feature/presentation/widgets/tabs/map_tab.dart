import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/app_scaffold.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/flutter_map_widget.dart';
import 'package:flutter_sweet_shop_app_ui/core/widgets/general_app_bar.dart';
import 'package:latlong2/latlong.dart';

class MapTab extends StatelessWidget {
  const MapTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: GeneralAppBar(title: 'Map', showBackIcon: false),
      padding: EdgeInsets.zero,
      body: FlutterMapWidget(latLng: LatLng(25.201723, 55.262675)),
    );
  }
}
