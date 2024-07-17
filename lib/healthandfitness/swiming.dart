import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SwimmingHealth extends StatefulWidget {
  const SwimmingHealth({Key? key}) : super(key: key);

  @override
  _SwimmingHealthState createState() => _SwimmingHealthState();
}

class _SwimmingHealthState extends State<SwimmingHealth> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/video_(2160p).mp4')
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
                     borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Swimming is a form of physical activity known for its numerous mental health benefits. Some of them:\n1. Stress Reduction\n2. Mood Enhancement\n3. Anxiety Relief\n4. Increased Brain Health\n5. Improved Sleep Quality\n\n',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                        ),
                        _controller.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              )
                            : CircularProgressIndicator(),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
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
                'Swimming',
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
