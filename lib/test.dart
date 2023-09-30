import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final double containerH,containerW;
final loading;
  VideoPlayerScreen({required this.videoUrl,required this.containerH,required this.containerW,required this.loading});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {

        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(width: widget.containerW,height: widget.containerH,
      child: _controller.value.isInitialized
          ? InkWell(
              onTap: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                    @override
                    void dispose() {
                      super.dispose();
                      _controller.dispose();
                    }
                  } else {
                    _controller.play();
                  }
                });
              },
              child: Container(padding: EdgeInsets.only(top: 5),
                width: widget.containerW,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
                height: widget.containerH,
                child: VideoPlayer(_controller),
              ),
            )
          :widget.loading=='ok'? Center(child: CircularProgressIndicator(),): null,
    );
  }


}
