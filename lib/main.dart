import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_ui/screen/home/provider/home_provider.dart';
import 'package:video_player_ui/screen/home/view/home_screen.dart';
import 'package:video_player_ui/screen/video/video_screen.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //initialRoute: ,
        routes: {
          '/':(context) => HomeScreen(),
          'videoscreen':(context) =>VideoScreen(),
        },
      ),
    ),
  );
}
