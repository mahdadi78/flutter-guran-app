import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ghoran_app/models/surah_model.dart';

class MyController extends GetxController {
  var futureSurahs = <Data>[].obs;
  var isLoading = true.obs;

  //todo لیست سوره ها گرفته میشود
  Future<List<Data>> getSurah() async {
    //! delete this FUture  later...
    await Future.delayed(const Duration(seconds: 1));
    List<Data> myListOFSurahs = [];
    isLoading(true);
    try {
      // https://api.alquran.cloud/v1/surah
      var response =
          await http.get(Uri.https('api.alquran.cloud', '/v1/surah'));
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (var eachSurah in jsonData[
            'data'] /*['data']      For more complex APIs, this section is used*/) {
          final myphoto = Data(
            number: eachSurah['number'],
            englishName: eachSurah['englishName'],
            englishNameTranslation: eachSurah['englishNameTranslation'],
            numberOfAyahs: eachSurah['numberOfAyahs'],
            revelationType: eachSurah['revelationType'],
          );
          myListOFSurahs.add(myphoto);
        }
      } else {
        print('StatusCode is: =>${response.statusCode}');
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
    print('onInit Ran');
  }
}
