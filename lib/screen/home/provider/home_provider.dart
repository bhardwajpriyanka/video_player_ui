import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class HomeProvider extends ChangeNotifier {

  VideoPlayerController? videoplayer;
  ChewieController? chewi;

  List Image = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img4.jpg",
    "assets/images/img5.jpg",
  ];
  List videodetail = [
    "Nature River",
    "River video",
    "Road video",
    "Forst Video",
    "City Video",
  ];
  List videopath = [
    "assets/video/video1.mp4",
    "assets/video/video2.mp4",
    "assets/video/video3.mp4",
    "assets/video/video4.mp4",
    "assets/video/video5.mp4",
  ];
  void videoload(int index) {
    videoplayer = VideoPlayerController.asset("${videopath[index]}")
      ..initialize();
    chewi = ChewieController(
      videoPlayerController: videoplayer!,
      autoPlay: false,
      looping: false,
    );
  }

  void pausesong() {
    chewi!.pause();
  }
}