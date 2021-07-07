import 'package:ccd_netflix_flutter/screen/home_screen.dart';
import 'package:ccd_netflix_flutter/screen/like_screen.dart';
import 'package:ccd_netflix_flutter/screen/more_screen.dart';
import 'package:ccd_netflix_flutter/screen/search_screen.dart';
import 'package:ccd_netflix_flutter/widget/bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TabController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              FutureBuilder(
                future: Firebase.initializeApp(),
                builder: (context, snapshot) => snapshot.hasError
                    ? Text('Error')
                    : snapshot.connectionState == ConnectionState.done
                        ? HomeScreen()
                        : LinearProgressIndicator(),
              ),
              SearchScreen(),
              LikeScreen(),
              MoreScreen(),
            ],
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}
