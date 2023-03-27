import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_ui/screen/home/provider/home_provider.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeProvider? homeProvidertrue;
  HomeProvider? homeProviderfalse;

  @override
  Widget build(BuildContext context) {
    homeProvidertrue = Provider.of<HomeProvider>(context, listen: false);
    homeProviderfalse = Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Video Player"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                var m1 = homeProviderfalse!.videoload(index);
                Navigator.pushNamed(context, 'videoscreen');
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 300,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.asset(
                            "${homeProviderfalse!.Image[index]}",
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${homeProviderfalse!.videopath[index]}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 5,
                      spreadRadius: -5,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    homeProviderfalse!.pausesong();
  }
}