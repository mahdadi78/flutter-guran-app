import 'package:get/get.dart';
import 'package:ghoran_app/models/translator_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetTranslateController extends GetxController {
  late int numberSurah;

  Future<List<TAyahs>> getSurah(int nS) async {
    List<TAyahs> myAlbumList = [];

    // http://api.alquran.cloud/v1/surah/114/en.asad
    var response =
        await http.get(Uri.https('api.alquran.cloud', '/v1/surah/$nS/en.asad'));
    var jsonData = jsonDecode(response.body);

    for (var eachListOfAyah in jsonData['data'][
        'ayahs'] /*['data']      For more complex APIs, this section is used*/) {
      final myphoto = TAyahs(
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
      myAlbumList.add(myphoto);
    }
    return myAlbumList;
  }
}
