import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class firstpage extends StatefulWidget {
  const firstpage({ Key? key }) : super(key: key);

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  bool playing = false;
  IconData playBtn = Icons.play_arrow;
  late AudioPlayer _player;
  late AudioCache cache;
  Duration position = new Duration();
  Duration musicLenght = new Duration();

  Widget slider() {
    return Slider.adaptive(
      activeColor: Color.fromARGB(255, 64, 231, 4),
      inactiveColor: Color.fromARGB(255, 217, 212, 212),
      value: position.inSeconds.toDouble(),
      max: musicLenght.inSeconds.toDouble(),
      onChanged: (value) {
        seekToSec(value.toInt());
      });
  }


  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    
    cache.load("bwi_music.mp3");
  }


  @override
  Widget build(BuildContext context) {
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 179, 212, 180),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            height: screenHeight/5,
            child: Container(
            color: Colors.green,
          ),
          ),
          Positioned(
            top: screenHeight*0.13,
            left: 0,
            right: 0,
            height: screenHeight*0.38,
            child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: screenHeight*0.1,),
                Text("CERITA RAKYAT", 
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Avenir"
                ),
                ),
                Text("Asal-Usul Banyuwangi", style: TextStyle(
                  fontSize: 15,
                ),),
                slider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.skip_previous),
                      color: Colors.black,
                      iconSize: screenWidth*0.09,),


                    IconButton(
                      onPressed: (){
                        if(!playing){
                          cache.play("bwi_music.mp3");
                          setState(() {
                            playBtn = Icons.pause;
                            playing = true;
                          });

                        }else{
                          _player.pause();
                          setState(() {
                            playBtn = Icons.play_arrow;
                            playing = false;
                          });

                        }
                      },
                      icon: Icon(playBtn),
                      color: Colors.black,
                      iconSize: screenWidth*0.1,),


                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.skip_next),
                      color: Colors.black,
                      iconSize: screenWidth*0.09,),
                  ],
                )

              ],
            ),
          ),
          ),
          Positioned(
            top: screenHeight*0.08,
            left: (screenWidth-200)/2,
            right: (screenWidth-200)/2,
            height: screenHeight*0.15,
            child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue, width: 2),
              image: DecorationImage(image: AssetImage("assets/bwi.jpg"),
              fit: BoxFit.cover)
            ),
          ),
          ),
          

        ],
      ),
      
    );
  }
}