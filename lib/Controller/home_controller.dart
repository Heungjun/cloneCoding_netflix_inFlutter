import 'package:ccd_netflix_flutter/model/model_movie.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  HomeController(this.movies);
  RxList<Movie> movies;
  RxInt currentPage = 0.obs;

  void currentPageUpdate(int index) {
    currentPage = index.obs;
    print('currentPage:$currentPage');
    update();
  }

  String get currentKeyword => movies[currentPage.value].keyword;
}
