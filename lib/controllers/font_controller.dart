// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:ghoran_app/consts/const.dart';

class FontController extends GetxController {
  backToDefaultFontSize() {
    fontSize_Ara.value = 15;
    fontSize_Eng.value = 15;
  }

  increaseFontSize_ara() {
    fontSize_Ara.value++;
  }

  decreaseFontSize_ara() {
    fontSize_Ara.value--;
  }

  increaseFontSize_eng() {
    fontSize_Eng.value++;
  }

  decreaseFontSize_eng() {
    fontSize_Eng.value--;
  }
}
