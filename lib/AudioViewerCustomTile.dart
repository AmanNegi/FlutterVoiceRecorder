import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voice_recorder/DialogBuilder.dart';

class AudioViewerCustomTile extends StatefulWidget {
  final String text;
  final String path;
  final double height;
  final double width;
  AudioViewerCustomTile({this.text, this.path, this.width, this.height});

  @override
  _AudioViewerCustomTileState createState() => _AudioViewerCustomTileState();
}

class _AudioViewerCustomTileState extends State<AudioViewerCustomTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        //color: Colors.transparent,
        elevation: 10.0,
        borderRadius: BorderRadius.circular(10.0),
        child: InkWell(
          splashColor: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(10.0),
          onTap: () {
            showGeneralDialog(
              pageBuilder: (c, a, a2) {},
              barrierDismissible: true,
              useRootNavigator: true,
              barrierLabel: "0",
              context: context,
              transitionDuration: Duration(milliseconds: 500),
              transitionBuilder: (BuildContext context, Animation a,
                  Animation b, Widget child) {
                final curvedValue = Curves.fastOutSlowIn.transform(a.value) - 1;
                return Transform(
                  transform: Matrix4.translationValues(
                      0, curvedValue * -widget.height, 0),
                  alignment: Alignment.center,
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: DialogBuilder(
                      path: widget.path,
                    ),
                  ),
                );
              },
            );
          },
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.music_note,
                  color: Colors.orange,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.text.split(".").first,
                    style: GoogleFonts.raleway(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
