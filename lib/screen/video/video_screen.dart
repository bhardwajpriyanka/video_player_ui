import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_ui/screen/home/provider/home_provider.dart';


class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<VideoScreen> {
  @override
  @override
  HomeProvider? homeProvidertrue;
  HomeProvider? homeProviderfalse;

  Widget build(BuildContext context) {
    var m1 = ModalRoute.of(context)!.settings.arguments;
    homeProvidertrue = Provider.of<HomeProvider>(context, listen: false);
    homeProviderfalse = Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            child: Chewie(
              controller: homeProvidertrue!.chewi!,
            )),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    homeProviderfalse!.pausesong();
  }
}
