import 'package:carousel_slider/carousel_slider.dart';
import 'package:ccd_netflix_flutter/Controller/carousel_slider_controller.dart';
import 'package:ccd_netflix_flutter/Controller/movie_controller.dart';
import 'package:ccd_netflix_flutter/model/model_movie.dart';
import 'package:ccd_netflix_flutter/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselImage extends GetView<MovieController> {
  const CarouselImage({Key? key, required this.movies}) : super(key: key);
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    Get.put(CarouselSliderController());

    return Obx(() => Container(
          child: Column(
            children: [
              Container(padding: const EdgeInsets.all(20)),
              CarouselSlider(
                items: movies
                    .map((element) => Image.network(element.poster))
                    .toList(),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    controller.changeMovie(movies[index]);
                    CarouselSliderController.to.updateCurrentIndex = index;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 3),
                child: Text(
                  controller.keyword,
                  style: TextStyle(fontSize: 11),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () => controller.updateMovieLike(),
                            icon: controller.like
                                ? Icon(Icons.check)
                                : Icon(Icons.add),
                          ),
                          Text(
                            '내가 찜한 콘텐츠',
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: TextButton(
                        child: Row(
                          children: [
                            Icon(
                              Icons.play_arrow,
                              color: Colors.black,
                            ),
                            Padding(padding: const EdgeInsets.all(3)),
                            Text(
                              '재생',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                        onPressed: () {},
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.white),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(
                                DetailScreen(),
                                fullscreenDialog: true,
                              );
                            },
                            icon: Icon(Icons.info),
                          ),
                          Text(
                            '정보',
                            style: TextStyle(fontSize: 11),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: makeIndicator(
                      movies.map((element) => element.like).toList(),
                      CarouselSliderController.to.currentIndex.value),
                ),
              )
            ],
          ),
        ));
  }

  List<Widget> makeIndicator(List list, int _currentPage) {
    List<Widget> results = [];

    for (int i = 0, loopCnt = list.length; i < loopCnt; i++) {
      results.add(
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == i
                  ? Color.fromRGBO(255, 255, 255, 0.9)
                  : Color.fromRGBO(255, 255, 255, 0.4)),
        ),
      );
    }

    return results;
  }
}
