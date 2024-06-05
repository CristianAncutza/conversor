import 'package:flutter/material.dart';
import '../models/convert_model.dart';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
const _URL_CONVERT = 'https://dolarapi.com/v1/dolares';

class ConvertService with ChangeNotifier {
  //el problema esta aca el json de la api de cotizacion devuelve un array en lugar de un objeto
  List<Convert> rates = [];

  ConvertService() {
    this.getRates();
  }

  getRates() async {
    // ignore: unnecessary_string_interpolations
    //print('pase por conversor service');
    const url = '$_URL_CONVERT';

    final resp = await http.get(Uri.parse(url));
        
    final convertResponse = convertFromJson(resp.body);

    this.rates.addAll(convertResponse);

    notifyListeners();
  }
}
