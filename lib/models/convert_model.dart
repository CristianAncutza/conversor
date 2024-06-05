// To parse this JSON data, do
//
//     final convert = convertFromJson(jsonString);

import 'dart:convert';

List<Convert> convertFromJson(String str) => List<Convert>.from(json.decode(str).map((x) => Convert.fromJson(x)));

String convertToJson(List<Convert> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Convert {
    String moneda;
    String casa;
    String nombre;
    double compra;
    double venta;
    DateTime fechaActualizacion;

    Convert({
        required this.moneda,
        required this.casa,
        required this.nombre,
        required this.compra,
        required this.venta,
        required this.fechaActualizacion,
    });

    factory Convert.fromJson(Map<String, dynamic> json) => Convert(
        moneda: json["moneda"],
        casa: json["casa"],
        nombre: json["nombre"],
        compra: json["compra"]?.toDouble(),
        venta: json["venta"]?.toDouble(),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
    );

    Map<String, dynamic> toJson() => {
        "moneda": moneda,
        "casa": casa,
        "nombre": nombre,
        "compra": compra,
        "venta": venta,
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
    };
}
