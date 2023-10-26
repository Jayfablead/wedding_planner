import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class addVideo extends StatefulWidget {
  String? videoid;

  addVideo({required this.videoid});

  @override
  State<addVideo> createState() => _addVideoState();
}

class _addVideoState extends State<addVideo> {
  late VideoPlayerController _controller;
  bool isPlay = false;

  @override
  void initState() {
    print(widget.videoid);
    super.initState();

    _controller = VideoPlayerController.network(widget.videoid.toString());

    _controller.addListener(() {
      if (_controller.value.isPlaying && _controller.value.isInitialized) {}
    });
    _controller.initialize().then((_) => setState(() {}));

    _controller.setVolume(0.0);
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 16 / 9,
        child: _controller == ''
            ? Container()
            : Center(
                child: _controller.value.isInitialized
                    ? Stack(
                        children: [
                          VideoPlayer(_controller),
                          Align(
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: () {
                                if (isPlay) {
                                  _controller.pause();
                                } else {
                                  _controller.play();
                                }

                                setState(() {
                                  isPlay = !isPlay;
                                });
                              },
                              icon: Icon(
                                isPlay ? Icons.pause_circle : Icons.play_circle,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'Loading...',
                            )
                          ],
                        )),
              ));
  }
}
