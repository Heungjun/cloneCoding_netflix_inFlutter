import 'package:ccd_netflix_flutter/model/model_movie.dart';
import 'package:ccd_netflix_flutter/screen/detail_screen.dart';
import 'package:flutter/material.dart';

class CircleSlider extends StatelessWidget {
  const CircleSlider({Key? key, required this.movies}) : super(key: key);
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('미리보기'),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeCircleImages(context, movies),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> makeCircleImages(BuildContext context, List<Movie> movies) {
    List<Widget> results = [];

    for (int i = 0, loopCnt = movies.length; i < loopCnt; i++) {
      results.add(InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailScreen(
              movie: movies[i],
            ),
            fullscreenDialog: true,
          ));
        },
        child: Container(
          padding: const EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundImage: AssetImage('Images/${movies[i].poster}'),
              radius: 48,
            ),
          ),
        ),
      ));
    }

    return results;
  }
}
