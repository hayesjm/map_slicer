import 'package:flutter/material.dart';
import 'map_slicer_home.dart';

class MapSlicerApp extends StatelessWidget {
  const MapSlicerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TSTS Map Slicer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MapSlicerHome(),
    );
  }
}