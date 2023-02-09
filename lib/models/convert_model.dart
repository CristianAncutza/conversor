// To parse this JSON data, do
//
//     final convertResponse = convertResponseFromJson(jsonString);

import 'dart:convert';

List<ConvertResponse> convertResponseFromJson(String str) =>
    List<ConvertResponse>.from(
        json.decode(str).map((x) => ConvertResponse.fromJson(x)));

String convertResponseToJson(List<ConvertResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConvertResponse {
  ConvertResponse({
    required this.casa,
  });

  Casa casa;

  factory ConvertResponse.fromJson(Map<String, dynamic> json) =>
      ConvertResponse(
        casa: Casa.fromJson(json["casa"]),
      );

  Map<String, dynamic> toJson() => {
        "casa": casa.toJson(),
      };
}

class Casa {
  Casa({
    required this.nombre,
    required this.compra,
    required this.venta,
    required this.agencia,
    required this.observaciones,
    this.geolocalizacion,
    this.telefono,
    this.direccion,
    required this.decimales,
  });

  String nombre;
  String compra;
  String venta;
  String agencia;
  Observaciones observaciones;
  Geolocalizacion? geolocalizacion;
  dynamic telefono;
  dynamic direccion;
  String decimales;

  factory Casa.fromJson(Map<String, dynamic> json) => Casa(
        nombre: json["nombre"],
        compra: json["compra"],
        venta: json["venta"],
        agencia: json["agencia"],
        observaciones: Observaciones.fromJson(json["observaciones"]),
        geolocalizacion: json["geolocalizacion"] == null
            ? null
            : Geolocalizacion.fromJson(json["geolocalizacion"]),
        telefono: json["telefono"],
        direccion: json["direccion"],
        decimales: json["decimales"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "compra": compra,
        "venta": venta,
        "agencia": agencia,
        "observaciones": observaciones.toJson(),
        "geolocalizacion": geolocalizacion?.toJson(),
        "telefono": telefono,
        "direccion": direccion,
        "decimales": decimales,
      };
}

class Observaciones {
  Observaciones();

  factory Observaciones.fromJson(Map<String, dynamic> json) => Observaciones();

  Map<String, dynamic> toJson() => {};
}

class Geolocalizacion {
  Geolocalizacion({
    required this.latitud,
    required this.longitud,
  });

  dynamic latitud;
  dynamic longitud;

  factory Geolocalizacion.fromJson(Map<String, dynamic> json) =>
      Geolocalizacion(
        latitud: json["latitud"],
        longitud: json["longitud"],
      );

  Map<String, dynamic> toJson() => {
        "latitud": latitud,
        "longitud": longitud,
      };
}
