import 'package:ccd_netflix_flutter/widget/bottom_bar.dart';
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
              Container(
                child: Center(
                  child: Text('home'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Search'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Save'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('More'),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}
