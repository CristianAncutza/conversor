import 'package:flutter/material.dart';
import '../models/convert_model.dart';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
const _URL_CONVERT = 'https://www.dolarsi.com/api/api.php?type=dolar';

class ConvertService with ChangeNotifier {
  //el problema esta aca el json de la api de cotizacion devuelve un array en lugar de un objeto
  List<ConvertResponse> rates = [];

  ConvertService() {
    print('pase por conversor service 2');
    this.getRates();
  }

  getRates() async {
    // ignore: unnecessary_string_interpolations
    print('pase por conversor service');
    const url = '$_URL_CONVERT';
    final resp = await http.get(Uri.parse(url));
    print(resp.body);
    final convertResponse = convertResponseFromJson(resp.body);
    print(convertResponse);
    //this.casa.addAll(convertResponse);
    notifyListeners();
  }
}
