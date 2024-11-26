import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../services/conversor_service.dart';  // Importa tu servicio ConvertService
import '../models/convert_model.dart';  // Si necesitas el modelo de Convert

class EvolutionChart extends StatelessWidget {
  final List<charts.Series<dynamic, DateTime>> seriesList;
  final bool animate;

  EvolutionChart(this.seriesList, {this.animate = false});

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  // Método para convertir las cotizaciones en datos de gráfico
  static List<charts.Series<dynamic, DateTime>> createSampleData(List<Convert> rates) {
    final data = rates.map((rate) {
      return CurrencyEvolution(DateTime.now(), rate.venta);  // Usa la fecha y valor de cada cotización
    }).toList();

    return [
      charts.Series<CurrencyEvolution, DateTime>(
        id: 'Dolar Blue',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (CurrencyEvolution evolution, _) => evolution.time,
        measureFn: (CurrencyEvolution evolution, _) => evolution.value,
        data: data,
      )
    ];
  }
}

class CurrencyEvolution {
  final DateTime time;
  final double value;

  CurrencyEvolution(this.time, this.value);
}
