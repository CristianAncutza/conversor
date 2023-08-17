// To parse this JSON data, do
//
//     final convertResponse = convertResponseFromJson(jsonString);

import 'dart:convert';

List<ConvertResponse> convertResponseFromJson(String str) => List<ConvertResponse>.from(json.decode(str).map((x) => ConvertResponse.fromJson(x)));

String convertResponseToJson(List<ConvertResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConvertResponse {
    Casa casa;

    ConvertResponse({
        required this.casa,
    });

    factory ConvertResponse.fromJson(Map<String, dynamic> json) => ConvertResponse(
        casa: Casa.fromJson(json["casa"]),
    );

    Map<String, dynamic> toJson() => {
        "casa": casa.toJson(),
    };
}

class Casa {
    String compra;
    dynamic venta;
    String agencia;
    String nombre;
    String? variacion;
    String? ventaCero;
    String? decimales;
    String? mejorCompra;
    String? mejorVenta;
    String? fecha;
    String? recorrido;
    Afluencia? afluencia;
    Afluencia? observaciones;

    Casa({
        required this.compra,
        required this.venta,
        required this.agencia,
        required this.nombre,
        this.variacion,
        this.ventaCero,
        this.decimales,
        this.mejorCompra,
        this.mejorVenta,
        this.fecha,
        this.recorrido,
        this.afluencia,
        this.observaciones,
    });

    factory Casa.fromJson(Map<String, dynamic> json) => Casa(
        compra: json["compra"],
        venta: json["venta"],
        agencia: json["agencia"],
        nombre: json["nombre"],
        variacion: json["variacion"],
        ventaCero: json["ventaCero"],
        decimales: json["decimales"],
        mejorCompra: json["mejor_compra"],
        mejorVenta: json["mejor_venta"],
        fecha: json["fecha"],
        recorrido: json["recorrido"],
        afluencia: json["afluencia"] == null ? null : Afluencia.fromJson(json["afluencia"]),
        observaciones: json["observaciones"] == null ? null : Afluencia.fromJson(json["observaciones"]),
    );

    Map<String, dynamic> toJson() => {
        "compra": compra,
        "venta": venta,
        "agencia": agencia,
        "nombre": nombre,
        "variacion": variacion,
        "ventaCero": ventaCero,
        "decimales": decimales,
        "mejor_compra": mejorCompra,
        "mejor_venta": mejorVenta,
        "fecha": fecha,
        "recorrido": recorrido,
        "afluencia": afluencia?.toJson(),
        "observaciones": observaciones?.toJson(),
    };
}

class Afluencia {
    Afluencia();

    factory Afluencia.fromJson(Map<String, dynamic> json) => Afluencia(
    );

    Map<String, dynamic> toJson() => {
    };
}
