import 'package:ccd_netflix_flutter/model/model_movie.dart';
import 'package:ccd_netflix_flutter/widget/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie.fromMap({
      'title': '로스쿨',
      'keyword': '미스터리/범죄/법정',
      'poster': 'law_school.jpg',
      'like': false
    }),
    Movie.fromMap({
      'title': '퀸스 갬빗',
      'keyword': '체스',
      'poster': 'queen\'s_gambit.jpg',
      'like': true
    }),
    Movie.fromMap({
      'title': '로스쿨',
      'keyword': '미스터리/범죄/법정',
      'poster': 'law_school.jpg',
      'like': true
    }),
    Movie.fromMap({
      'title': '퀸스 갬빗',
      'keyword': '체스',
      'poster': 'queen\'s_gambit.jpg',
      'like': false
    })
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            CarouselImage(movies: movies),
            TopBar(),
          ],
        )
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'Images/logo_t2.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.only(right: 1),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 1),
            child: Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
