import 'package:flutter/material.dart';

class PlotsScreens extends StatefulWidget {
  const PlotsScreens({super.key});

  @override
  State<PlotsScreens> createState() => _PlotsScreensState();
}

class _PlotsScreensState extends State<PlotsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('plot')));
  }
}
