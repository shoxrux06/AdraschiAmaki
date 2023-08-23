import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerNetworkImage extends StatefulWidget {
  final String? videoFile;
  const VideoPlayerNetworkImage(this.videoFile, {super.key});

  @override
  VideoPlayerNetworkImageState createState() => VideoPlayerNetworkImageState();
}

class VideoPlayerNetworkImageState extends State<VideoPlayerNetworkImage> {
  late VideoPlayerController _controller;
  bool _onTouch = false;
  Timer? _timer;


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoFile??'');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(false);
    _controller.initialize().then((_) => setState(() {
    }));
    // _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: GestureDetector(
        onTap: () {
          _timer?.cancel();
          // pause while video is playing, play while video is pausing
          setState(() {
            _onTouch = !_onTouch;
            _controller.value.isPlaying ?
            _controller.pause() :
            _controller.play();
          });

          // Auto dismiss overlay after 1 second
          _timer = Timer.periodic(Duration(milliseconds: 1000), (_) {
            setState(() {
              _onTouch = false;
            });
          });
        },
        child:_controller.value.isInitialized? Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            VideoPlayer(_controller),
            Visibility(
              visible: _onTouch,
              child: Container(
                color: Colors.grey.withOpacity(0.5),
                alignment: Alignment.center,
                child: Container(
                  child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white,),
                ),
              ),
            ),
            VideoProgressIndicator(_controller, allowScrubbing: true),
          ],
        ): const Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}
