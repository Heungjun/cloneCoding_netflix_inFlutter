import 'package:ccd_netflix_flutter/model/model_movie.dart';
import 'package:ccd_netflix_flutter/screen/detail_screen.dart';
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
              children: makeBoxImages(context, movies),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> makeBoxImages(BuildContext context, List<Movie> movies) {
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
            child: Image.asset('Images/${movies[i].poster}'),
          ),
        ),
      ));
    }

    return results;
  }
}
