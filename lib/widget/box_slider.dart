import 'package:ccd_netflix_flutter/model/model_movie.dart';
import 'package:flutter/material.dart';

class BoxSlider extends StatelessWidget {
  const BoxSlider({Key? key, required this.movies}) : super(key: key);
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('지금 뜨는 콘텐츠'),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(movies),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> makeBoxImages(List<Movie> movies) {
    List<Widget> results = [];

    for (int i = 0, loopCnt = movies.length; i < loopCnt; i++) {
      results.add(InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset('images/${movies[i].poster}'),
          ),
        ),
      ));
    }

    return results;
  }
}
