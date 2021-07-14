import 'package:ccd_netflix_flutter/model/model_movie.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  static MovieController get to => Get.find();

  MovieController(this._movie);
  Rx<Movie> _movie;
  Movie get movie => _movie.value;

  String get title => movie.title;
  String get keyword => movie.keyword;
  String get poster => movie.poster;
  bool get like => movie.like;
  // DocumentReference reference;

  void changeMovie(Movie currentMovie) => _movie(currentMovie);
  void updateMovieLike() {
    // _movie(Movie.fromMap({
    //   'like': !like,
    //   'title': 'test',
    //   'keyword': '없음',
    //   'poster': movie.poster
    // }, reference: movie.reference));
    _movie.update((val) => val!.like = !like);
    movie.reference.update({'like': movie.like});
  }

  @override
  void onInit() {
    ever(_movie, (_) => print('test movie change'));
    super.onInit();
  }
}
