import 'package:get/get.dart';
import 'package:ghoran_app/consts/const.dart';

class FontController extends GetxController {
  increaseFontSize() {
    fontSize.value++;
    print('increase clicked ');
  }

  decreaseFontSize() {
    fontSize.value--;
    print('decrease clicked');
  }
}
