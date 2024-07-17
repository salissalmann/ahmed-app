import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BoxBreathing extends StatefulWidget {
  const BoxBreathing({Key? key}) : super(key: key);

  @override
  _BoxBreathingState createState() => _BoxBreathingState();
}

class _BoxBreathingState extends State<BoxBreathing> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/box.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFecfdc598),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(42),
        child: AppBar(
          backgroundColor: Color(0xFFecfdc598),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 34,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 2,
        ),
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, -1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 80),
                child: Container(
                  width: 406,
                  height: 592,
                  decoration: BoxDecoration(
                      color: Color(0xFFe6e6fa),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Box breathing, also known as square breathing or four-square breathing, is a relaxation technique that involves a pattern of equal-length inhales, holds, exhales, and holds, typically in four-second increments. This technique can be beneficial for mental health in several ways:\n1. Stress Reduction\n2. Anxiety Management\n3. Improved Focus and Clarity\n4. Emotional Regulation\n5. Reduced Physical Symptoms',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                        ),
                        _controller.value.isInitialized
                            ? Container(
                                height: 300,
                                child: AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: VideoPlayer(_controller),
                                ),
                              )
                            : CircularProgressIndicator(),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _controller.value.isPlaying
                                      ? _controller.pause()
                                      : _controller.play();
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.13, -0.89),
              child: Text(
                'Box Breathing',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Color(0xFF249689),
                  fontSize: 35,
                  letterSpacing: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
