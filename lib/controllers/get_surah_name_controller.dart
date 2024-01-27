import 'dart:convert';
import 'package:get/get.dart';
import 'package:ghoran_app/models/ayas_model.dart';
import 'package:http/http.dart' as http;
import 'package:ghoran_app/models/surah_model.dart';

class GetSurahNameController extends GetxController {
  var futureSurahs = <DataS>[].obs;
  var isLoading = true.obs;

  var futureAyasPerSureh = <Ayahs>[];

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

  @override
  void onInit() {
    getSurah().then((value) => futureSurahs = value.obs);
    super.onInit();
    // ignore: avoid_print
    print('GetSurahName  onInit  launched...');
  }
}
