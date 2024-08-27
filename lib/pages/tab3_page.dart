import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
      // Puedes personalizar más opciones aquí
    );
  }

  static List<charts.Series<dynamic, DateTime>> createSampleData() {
    final data = [
      CurrencyEvolution(DateTime(2023, 8, 1), 150),
      CurrencyEvolution(DateTime(2023, 9, 1), 155),
      CurrencyEvolution(DateTime(2023, 10, 1), 160),
      CurrencyEvolution(DateTime(2023, 11, 1), 162),
      CurrencyEvolution(DateTime(2023, 12, 1), 165),
      // Agrega más datos aquí
    ];

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
