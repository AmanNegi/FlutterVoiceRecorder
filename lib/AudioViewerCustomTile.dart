import 'package:flutter/material.dart';
import 'package:voice_recorder/AudioPlayerClass.dart';

class AudioViewerCustomTile extends StatelessWidget {
  final String text;
  final String path;
  AudioViewerCustomTile({this.text, this.path});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    child: AudioPlayerClass(
                      path: path,
                    ),
                  );
                });
          },
          leading: Icon(
            Icons.music_note,
            color: Colors.orange,
          ),
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
