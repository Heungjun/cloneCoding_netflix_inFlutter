import 'package:get/get.dart';

class CarouselSliderController extends GetxController {
  static CarouselSliderController get to => Get.find();

  RxInt currentIndex = 0.obs;

  set updateCurrentIndex(value) => currentIndex(value);
}
