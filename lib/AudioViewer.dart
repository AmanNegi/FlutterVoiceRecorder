import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:storage_path/storage_path.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:voice_recorder/AudioViewerCustomTile.dart';
import 'package:voice_recorder/CurvePainter.dart';
import 'package:voice_recorder/ListPainter.dart';

class AudioViewer extends StatefulWidget {
  @override
  _AudioViewerState createState() => _AudioViewerState();
}

class _AudioViewerState extends State<AudioViewer> {
  var audioPath;
  var directory;
  List file = List();

  @override
  void initState() {
    super.initState();
    getFiles();
  }

  void getFiles() async {
    directory = (await getExternalStorageDirectory()).path;
    setState(() {
      file = Directory("$directory").listSync();
    });
    print(file.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Audio List"),
      ),
      body: Container(
        child: CustomPaint(
          painter: ListPainter(color1: Colors.deepOrange),
          child: ListView.builder(
            itemCount: file.length,
            itemBuilder: (BuildContext context, int index) {
              return AudioViewerCustomTile(
                text: file[index].path.split('/').last,
                path: file[index].path.toString(),
              );
            },
          ),
        ),
      ),
    );
  }
}
