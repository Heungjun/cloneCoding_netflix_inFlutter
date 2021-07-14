import 'package:ccd_netflix_flutter/model/model_movie.dart';
import 'package:get/get.dart';

class HomeController extends GetxService {
  static HomeController get to => Get.find();

  HomeController(this.movies);
  RxList<Movie> movies;

  String get currentKeyword => movies[currentPage.value].keyword;
  bool get currentLike => movies[currentPage.value].like;
  Movie get currentMovie => movies[currentPage.value];

  RxInt currentPage = 0.obs;
  set currentPageUpdate(int index) => currentPage(index);

  void updateMovieLike(int index) => movies[index]
      .reference
      .update({'like': movies[index].like = !movies[index].like});
}
