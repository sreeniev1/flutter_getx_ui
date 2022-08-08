import 'package:get/get.dart';

class DetailController extends GetxController {
  var fav = 0.obs;

  makeFavourite() {
    if (fav.value == 1) {
      Get.snackbar('Loved It!', 'You already loved it.');
    } else {
      fav.value++;
      Get.snackbar('Loved It!', 'Thank you');
    }
  }
}
