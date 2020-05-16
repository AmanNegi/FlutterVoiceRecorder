import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voice_recorder/AudioViewer.dart';
import 'AnimatedHome.dart';

class MainScreenBuilder extends StatefulWidget {
  @override
  _MainScreenBuilderState createState() => _MainScreenBuilderState();
}

class _MainScreenBuilderState extends State<MainScreenBuilder> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(
          Icons.storage,
          color: Colors.white,
        ),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AudioViewer(),
            ),
          );
        },
        // shape: FabTriangleCustomShapeBorder(),
      ),
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        title: new Text(
          'Voice Recorder',
          style: GoogleFonts.raleway(fontWeight: FontWeight.w500),
        ),
      ),
      body: AnimatedHome(),
    );
  }
}
