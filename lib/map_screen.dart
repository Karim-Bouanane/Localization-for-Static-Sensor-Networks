import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

final _database = FirebaseDatabase.instance;
DatabaseReference ref = _database.ref("");

class _MapScreenState extends State<MapScreen> {
  void markersFromDB() async {
    DatabaseEvent event = await ref.once();
    Map<String, dynamic> map = event.snapshot.value;
    map.forEach((key, jsonString) {
      print('$key: $jsonString'); // jsonString = {img1:value1}
    });
  }

  @override
  void initState() {
    markersFromDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
          attributionBuilder: (_) {
            return Text("");
          },
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(51.5, -0.09),
              builder: (ctx) => Container(
                child: Icon(Icons.location_on_rounded),
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(51.4, -0.09),
              builder: (ctx) => Container(
                child: Icon(Icons.location_on_rounded),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
