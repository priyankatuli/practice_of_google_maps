import 'package:flutter/material.dart';
import 'package:practice_of_google_maps/screens/map_screen.dart';


class GoogleMapApp extends StatelessWidget{
  const GoogleMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MapScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[600],
      ),
    );
  }

}