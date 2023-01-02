import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:em_app/em_global.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

//void main() => runApp(const VideoPlayerApp());

/*
class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VideoPlayerScreen();
    /*
    return const MaterialApp(
      title: 'Video Player',
      home: VideoPlayerScreen(),
    );
    */
  }
}
*/

class VideoPlayerScreen extends StatefulWidget {
  final String fromSource;
  final String sourceUrlPathBase64;

  const VideoPlayerScreen(
      {Key? key, required this.fromSource, required this.sourceUrlPathBase64})
      : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerUrlFuture;
  late Future<void> _initializeVideoPlayerBase64Future;
  //late Future<void> _devFile;
  late File gotFile;
  bool _loading = true;
  bool _videoInitOk = false;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    /*
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    */
    switch (widget.fromSource) {
      case "Network":
        {
          // _devFile = _createFileFromString("");
          _controller =
              VideoPlayerController.network(widget.sourceUrlPathBase64);
          _loading = false;
          // Initialize the controller and store the Future for later use.
          _initializeVideoPlayerUrlFuture = _controller.initialize().then((_) {
            setState(() {
              _videoInitOk = true;
            });
          });
          //_initializeVideoPlayerBase64Future = _initializeVideoPlayerUrlFuture;

          // Use the controller to loop the video.
          _controller.setLooping(true);
        }
        break;
      case "Asset":
        {
          // _devFile = _createFileFromString("");
          _controller = VideoPlayerController.asset(widget.sourceUrlPathBase64);
          _loading = false;
          // Initialize the controller and store the Future for later use.
          _initializeVideoPlayerUrlFuture = _controller.initialize().then((_) {
            setState(() {
              _videoInitOk = true;
            });
          });
          //_initializeVideoPlayerBase64Future = _initializeVideoPlayerUrlFuture;

          // Use the controller to loop the video.
          _controller.setLooping(true);
        }
        break;
      case "Base64":
        {
          initVideoFromBase64(widget.sourceUrlPathBase64);
          // getFileFromBase64(widget.sourceUrlPathBase64);
          /*
          if (devFile != null ) {
          print("File : NOT null "+devFile!.path);
          _controller = VideoPlayerController.file(devFile!);
          } else {
          print("File : IS null ");
            //use empty Video URL
          _controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
          }
          */
        }
        break;
      default:
    }
  }

  Future initVideoFromBase64(String base64Str) async {
    gotFile = await _createFileFromString(base64Str);
    print("File : " + gotFile.path);
    var len = await gotFile.length();
    print("File Length : " + len.toString());
    //return file;
    //return file;
    //setState(() {
    //gotFile = file; //isLoading = false;
    //});
    _controller = VideoPlayerController.file(gotFile);
    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerBase64Future = _controller.initialize().then((_) {
      setState(() {
        _videoInitOk = true;
      });
    });
    //_initializeVideoPlayerUrlFuture = _initializeVideoPlayerBase64Future;

    // Use the controller to loop the video.
    _controller.setLooping(true);
    _loading = false;
    //return file; //.path;
  }

  Future<File> _createFileFromString(String base64Str) async {
    print("Creating Dev File : ");
    //final encodedStr = "put base64 encoded string here";
    Uint8List bytes = base64.decode(base64Str);
    print("Bytes : " + bytes.length.toString());

    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File("$dir/" +
        DateTime.now().millisecondsSinceEpoch.toString() +
        "emFile.mp4");
    return await file.writeAsBytes(bytes);
    //return file;
    //print("File : " + file.path);
    //print("File Length : " + file.length().toString());
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        title: const Text('Play Video'),
      ),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: Container(
        width: emFormFixedWidth,
        //height: emFormFixedHeight,
        //height: MediaQuery.of(context).size.height,
        //	 width: formWidth,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        //padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: const BoxDecoration(
            //color: Colors.blue.shade200,
            ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                _loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : getFutBuilderVp(),

                /*
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Back'),
                  onTap: ()  {} ,
                ),
                */
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          _controller.pause();
                        },
                        child: const Icon(Icons.pause)),
                    const Padding(padding: EdgeInsets.all(2)),
                    ElevatedButton(
                        onPressed: () {
                          _controller.play();
                        },
                        child: const Icon(Icons.play_arrow)),
                    const Padding(padding: EdgeInsets.all(2)),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate back to first route when tapped.
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close), //const Text('Close'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
      */
    );
  }

  Widget getFutBuilderVp() {
    switch (widget.fromSource) {
      case "Base64":
        {
          return getFutBuilderVpBase64();
        }
      default:
        return getFutBuilderVpUrl();
    }
  }

  Widget getFutBuilderVpUrl() {
    return FutureBuilder(
      //future: _initializeVideoPlayerFuture,
      future: Future.wait([
        _initializeVideoPlayerUrlFuture,
      ]),
      builder: (context, snapshot) {
        //if (snapshot.connectionState == ConnectionState.done) {
        if (_videoInitOk) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          return Column(
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                // Use the VideoPlayer widget to display the video.
                child: VideoPlayer(_controller),
              ),
              getVpProgressInd(),
            ],
          );
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget getFutBuilderVpBase64() {
    return FutureBuilder(
      future: Future.wait([
        _initializeVideoPlayerBase64Future,
      ]),
      builder: (context, snapshot) {
        if (_videoInitOk) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          return Column(
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                // Use the VideoPlayer widget to display the video.
                child: VideoPlayer(_controller),
              ),
              getVpProgressInd(),
            ],
          );
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget getVpProgressInd() {
    return VideoProgressIndicator(
      _controller,
      allowScrubbing: true,
      colors: const VideoProgressColors(
          backgroundColor: Colors.grey,
          bufferedColor: Colors.black,
          playedColor: Colors.blueAccent),
    );
  }
}
