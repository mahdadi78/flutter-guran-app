import 'dart:convert';

import 'package:get/get.dart';
import 'package:ghoran_app/models/ayas_model.dart';
import 'package:http/http.dart' as http;
import 'package:ghoran_app/models/surah_model.dart';

class MyController extends GetxController {
  var futureSurahs = <DataS>[].obs;
  var isLoading = true.obs;

  var futureAyas = <Ayahs>[].obs;
  var isLoadingAyas = true.obs;

  //todo لیست سوره ها گرفته میشود
  Future<List<DataS>> getSurah() async {
    List<DataS> myListOFSurahs = [];
    isLoading(true);
    try {
      // https://api.alquran.cloud/v1/surah
      var response =
          await http.get(Uri.https('api.alquran.cloud', '/v1/surah'));
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (var eachSurah in jsonData[
            'data'] /*['data']      For more complex APIs, this section is used*/) {
          final myphoto = DataS(
            number: eachSurah['number'],
            englishName: eachSurah['englishName'],
            englishNameTranslation: eachSurah['englishNameTranslation'],
            numberOfAyahs: eachSurah['numberOfAyahs'],
            revelationType: eachSurah['revelationType'],
          );
          myListOFSurahs.add(myphoto);
        }
      }
    } finally {
      isLoading(false);
    }

    return myListOFSurahs;
  }

  //todo   شماره سوره ارسال باید بشه ،در نهایت آیه ها دریافت میشود
  Future<List<Ayahs>> getAyas(int numberSurah) async {
    List<Ayahs> myListOFAyahs = [];
    isLoadingAyas(true);
    try {
      // https://api.alquran.cloud/v1/surah/$numberSurah
      var response = await http
          .get(Uri.https('api.alquran.cloud', '/v1/surah/$numberSurah'));
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (var eachListOfAyah in jsonData['data'][
            'ayahs'] /*['data']      For more complex APIs, this section is used*/) {
          final myphoto = Ayahs(
            number: eachListOfAyah['number'],
            text: eachListOfAyah['text'],
            numberInSurah: eachListOfAyah['numberInSurah'],
            juz: eachListOfAyah['juz'],
            manzil: eachListOfAyah['manzil'],
            page: eachListOfAyah['page'],
            ruku: eachListOfAyah['ruku'],
            hizbQuarter: eachListOfAyah['hizbQuarter'],
            sajda: eachListOfAyah['sajda'],
          );
          eachListOfAyah.add(myphoto);
        }
      }
    } finally {
      isLoadingAyas(false);
    }

    return myListOFAyahs;
  }

  @override
  void onInit() {
    getSurah().then((value) => futureSurahs = value.obs);
    super.onInit();
    print('onInit Ran');
  }
}
