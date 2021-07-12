import 'package:get/get.dart';

class CarouselController extends GetxController {
  static CarouselController get to => Get.find();

  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) => currentIndex(index);
}
