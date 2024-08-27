//added marker,polyline ,polygon and circle

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapScreen extends StatefulWidget{
  const MapScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MapScreenState();
  }

}

class _MapScreenState extends State<MapScreen>{

  late GoogleMapController _googleMapController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller){
          _googleMapController = controller;
        },
        mapType: MapType.terrain,
        initialCameraPosition: const CameraPosition(
            target: LatLng(24.76142048417938, 90.40164439586924),
            zoom: 15
        ),
        onTap: (LatLng latlng){
          print(latlng);
        },
        zoomControlsEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        polylines: <Polyline>{
          Polyline(
              polylineId: const PolylineId('sample'),
              color: Colors.pink,
              width: 8,
              visible: true,
              onTap: (){
                //event fire korte chan
                print('Tap on polyline');
              },
              jointType: JointType.mitered,
              points: const [
                LatLng(24.761371772052158, 90.40168731121459),
                LatLng(24.76223397388069, 90.39989023112842),
                LatLng(24.760149091402134, 90.40081827547147),

              ]
          ),

        },
        circles: <Circle>{
          Circle(
              circleId: CircleId('near-to-home-circle'),
              center: LatLng(24.7604490149752, 90.4014204069972),
              radius: 10,
              strokeWidth: 5,
              strokeColor: Colors.blue,
              fillColor: Colors.yellow.withOpacity(0.4),
              onTap: (){
                print('circle tapped');
              }
          )
        },
        polygons: <Polygon>{
          Polygon(
              polygonId: PolygonId('polygon-d'),
              strokeWidth: 5,
              strokeColor: Colors.orange.withOpacity(0.4),
              fillColor: Colors.white,
              points: const [
                LatLng(24.760805833522053, 90.40184285491705),
                LatLng(24.761011947522775, 90.40209129452705),
                LatLng(24.76066121862019, 90.40190890431404),
                LatLng(24.760945272573263, 90.40218248963356),
                LatLng(24.760945272573263, 90.40218248963356),
                LatLng(24.760778128364397, 90.40220763534307)
              ]
          ),

        },
        markers: <Marker>{
          Marker(
            markerId: MarkerId('Amar Basha'),
            position: LatLng(24.76142048417938, 90.40164439586924),
            infoWindow: InfoWindow(
                title: 'PanditBari'
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueCyan
            ),
          ),
          Marker(
              markerId: MarkerId('Location-Picker'),
              position: LatLng(24.7604490149752, 90.4014204069972),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueOrange
              ),
              draggable: true,
              onDrag: (LatLng LatLng){
                print('on at $LatLng');
              }
          )
        },
      ),
    );
  }

    }