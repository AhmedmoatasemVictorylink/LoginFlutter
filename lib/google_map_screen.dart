import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:login_app/utils/authentication.dart';
import 'package:login_app/utils/custom_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  static final LatLng _kMapCenter = LatLng(29.9602, 31.2569);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  Set<Marker> _createMarker() {
    return {
      Marker(
          markerId: const MarkerId("marker_1"),
          position: _kMapCenter,
          infoWindow: const InfoWindow(title: 'Maadi marker'),
          rotation: 0),
      const Marker(
          markerId: MarkerId("marker_2"),
          position: LatLng(30.0511, 31.3656),
          infoWindow: InfoWindow(title: 'Nasr city marker'),
          rotation: 0),
    };
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.firebaseNavy,
        title: Text(
          t!.mapTitle,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        mapType: MapType.normal,
        myLocationEnabled: true,
        markers: _createMarker(),
        trafficEnabled: true,
        onTap: (latLong) {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
                content:
                    'Tapped location Lat is ${latLong.latitude}\n and long is ${latLong.longitude}'),
          );
        },
      ),
    );
  }
}
