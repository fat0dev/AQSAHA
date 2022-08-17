import 'package:aqsaha/src/theme/theme.dart';
import 'package:aqsaha/src/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AboutAqsaha extends StatefulWidget {
  const AboutAqsaha({Key? key}) : super(key: key);

  @override
  State<AboutAqsaha> createState() => _AboutAqsahaState();
}

class _AboutAqsahaState extends State<AboutAqsaha> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    const url = 'https://youtu.be/LI9XqBSxK3A';
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false, // is video sound playing?
        loop: true, // is same video repeated?
        autoPlay: true, // is video played when initialized?
        forceHD: true, // is always play the video in HD mode.
        hideControls: true, // hide youtube player controls.
      )
    )..addListener(() {
      if(mounted) {
        setState(() {
          
        });
      }
    });
    super.initState();
  }


  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
    player: YoutubePlayer(
      controller: controller,
    ),
    builder: (context, player) => Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: const Text('About'),
      ),
      body: Column(
        children: [
          player,
          const SizedBox(height: 6,),
        IconBorder(icon: controller.value.isPlaying ? Icons.play_circle_fill_outlined
        : Icons.pause_circle_filled_outlined,
        onTap:(){
          if(controller.value.isPlaying) {
            controller.pause();
          } else {
            controller.play();
          }
        }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(controller.metadata.title,
          style: const TextStyle(
            color: AqsahaColors.textFaded
          ),
          ),
        )
        ],
      ),
    ), 

  );
}