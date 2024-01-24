import 'dart:convert';

import 'package:get/get.dart';
import 'package:ghoran_app/models/ayas_model.dart';
import 'package:http/http.dart' as http;

class TestController extends GetxController {
  late int numbersurah;

  Future<List<Ayahs>> getHAMD() async {
    List<Ayahs> myAlbumList = [];

    // https://api.alquran.cloud/v1/surah/1
    var response =
        await http.get(Uri.https('api.alquran.cloud', '/v1/surah/2'));
    var jsonData = jsonDecode(response.body);

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
      myAlbumList.add(myphoto);
    }
    return myAlbumList;
  }
}
