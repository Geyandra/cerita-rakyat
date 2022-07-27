import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class audiofiles extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  const audiofiles({ Key? key, required this.advancedPlayer }) : super(key: key);

  @override
  State<audiofiles> createState() => _audiofilesState();
}

class _audiofilesState extends State<audiofiles> {
  @override
  Widget build(BuildContext context) {
    Duration _duration = new Duration();
    Duration _position = new Duration();
    final String path = 'bwi.mp3';
    bool isPlaying =false;
    bool isPaused=false;
    bool isLoop=false;
    List<IconData> _icons = [
      Icons.play_circle_fill,
      Icons.pause_circle_filled,
    ];


    @override
    void initState(){
      super.initState();
      this.widget.advancedPlayer.onDurationChanged.listen((d) {setState(() {
        _duration=d;
      });});
      this.widget.advancedPlayer.onAudioPositionChanged.listen((p) {setState(() {
        _position=p;
      });});
      this.widget.advancedPlayer.setUrl(path);
    }

    Widget btnStart() {
      return IconButton(
        padding: EdgeInsets.only(bottom: 10),
        onPressed: (){}, icon: Icon(_icons[0]));
    }

    Widget loadAssets(){
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            btnStart()
          ],),
          
      );
    }

    @override
    Widget build(BuildContext context) {
      return Container(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            ),
            loadAssets()
            
          ],
        ),
      );
    }
    return Container(
      
    );
  }
}