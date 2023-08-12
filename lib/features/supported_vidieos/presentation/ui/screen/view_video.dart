import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ViewVideo extends StatefulWidget {
  const ViewVideo({super.key});

  @override
  State<ViewVideo> createState() => _ViewVideoState();
}

class _ViewVideoState extends State<ViewVideo> {
  // final YoutubePlayerController _controller = YoutubePlayerController(
  //   initialVideoId: 'iLnmTe5Q2Qw',
  //   flags: const YoutubePlayerFlags(
  //     autoPlay: true,
  //     mute: true,
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    // return Scaffold(
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       YoutubePlayer(
    //         controller: _controller,
    //         showVideoProgressIndicator: true,
    //         progressIndicatorColor: Colors.amber,
    //         onReady: () {
    //           _controller.addListener(() {});
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
