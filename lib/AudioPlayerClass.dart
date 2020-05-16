import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerClass extends StatefulWidget {
  final String path;

  AudioPlayerClass({this.path});

  @override
  _AudioPlayerClassState createState() => _AudioPlayerClassState();
}

class _AudioPlayerClassState extends State<AudioPlayerClass> {
  AudioPlayer audioPlayer;
  bool _isplaying = false;
  var _icon = Icons.play_arrow;
  var _color = Colors.green;
  Duration position = Duration();
  Duration duration = Duration(seconds: 1);

  String _getDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  _play() {
    audioPlayer.resume();
    setState(() {
      _isplaying = true;
      _icon = Icons.pause;
      _color = Colors.red;
    });
  }

  _stop() {
    audioPlayer.release();
    setState(() {
      position = new Duration();
      _isplaying = false;
      _icon = Icons.play_arrow;
      _color = Colors.green;
    });
  }

  _stateListener(AudioPlayerState state) {
    print(" In _stateListener  the state of AudioPlayer :- " +
        state.toString() +
        "\n");
    if (state == AudioPlayerState.COMPLETED) {
      Navigator.pop(context);
      _stop();
    }
  }

  _setupAudioPlayer() async {
    position = new Duration(seconds: 0);
    audioPlayer = AudioPlayer();
    await audioPlayer.setUrl(widget.path);
    await audioPlayer.setReleaseMode(ReleaseMode.STOP);

    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      print('Current position: $p');
      setState(() => position = p);
    });

    audioPlayer.onDurationChanged.listen((Duration d) {
      print('Max duration: $d');
      setState(() => duration = d);
    });
    audioPlayer.onPlayerStateChanged.listen(_stateListener);
  }

  @override
  void initState() {
    _setupAudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          Center(
            child: IconButton(
              iconSize: 100,
              onPressed: () {
                if (!_isplaying) {
                  _play();
                } else {
                  _stop();
                }
              },
              icon: Icon(_icon),
              color: _color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation(Colors.green),
              value: (position.inMilliseconds / duration.inMilliseconds) * 1.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _getDuration(position),
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  _getDuration(duration),
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
