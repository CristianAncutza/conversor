import 'package:flutter/material.dart';
import '../models/convert_model.dart';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
const _URL_CONVERT = 'https://www.dolarsi.com/api/api.php?type=dolar';

class ConvertService with ChangeNotifier {
  Casa casa = Casa(
      agencia: '',
      compra: '',
      decimales: '',
      nombre: '',
      observaciones: Observaciones(),
      venta: '');

  ConvertService() {
    getTopHeadLines();
  }

  getTopHeadLines() async {
    // ignore: unnecessary_string_interpolations
    const url = '$_URL_CONVERT';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = convertResponseFromJson(resp.body);
    print('test');
    //this.casa.addAll(newsResponse.last.casa);
    casa.nombre = newsResponse.last.casa.nombre;
  }
}
