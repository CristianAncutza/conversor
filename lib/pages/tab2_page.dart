import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/conversor_service.dart';
import '../services/localization_service.dart';

class Tab2Page extends StatefulWidget {
  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page> with AutomaticKeepAliveClientMixin {
  String result = "0.00";
  String currency = "dolar";
  String value1 = "Dolar (USD)";
  String value2 = "Peso (ARS)";
  String selectedDollarType = "Dolar Blue";
  List<String> dollarTypes = [
    "Dolar Blue",
    "Dolar Oficial",
    "Dolar Bolsa",
    "Dolar Contado con liquidación",
    "Dolar Mayorista",
    "Dolar Cripto",
    "Dolar Tarjeta"
  ];
  double inputValue = 0.0;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    super.build(context);

    final headlines = Provider.of<ConvertService>(context);
    final localizationService = Provider.of<LocalizationService>(context);

    double selectedDollarRate = 0.0;

    // Calcula la tasa de conversión según el tipo de dólar seleccionado
    switch (selectedDollarType) {
      case "Dolar Blue":
        selectedDollarRate = headlines.rates.isNotEmpty ? headlines.rates[1].venta : 0.0;
        break;
      case "Dolar Oficial":
        selectedDollarRate = headlines.rates.isNotEmpty ? headlines.rates[0].venta : 0.0;
        break;
      case "Dolar Bolsa":
        selectedDollarRate = headlines.rates.isNotEmpty ? headlines.rates[2].venta : 0.0;
        break;
      case "Dolar Contado con liquidación":
        selectedDollarRate = headlines.rates.isNotEmpty ? headlines.rates[3].venta : 0.0;
        break;
      case "Dolar Mayorista":
        selectedDollarRate = headlines.rates.isNotEmpty ? headlines.rates[4].venta : 0.0;
        break;
      case "Dolar Cripto":
        selectedDollarRate = headlines.rates.isNotEmpty ? headlines.rates[5].venta : 0.0;
        break;
      case "Dolar Tarjeta":
        selectedDollarRate = headlines.rates.isNotEmpty ? headlines.rates[6].venta : 0.0;
        break;
      default:
        selectedDollarRate = 0.0;
    }

    // Si el valor de entrada ha cambiado, recalcular la conversión automáticamente
    if (inputValue != 0.0) {
      if (currency == "dolar") {
        result = (inputValue * selectedDollarRate).toStringAsFixed(2);
      } else {
        result = (inputValue / selectedDollarRate).toStringAsFixed(2);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Contenedor para la lista desplegable
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedDollarType,
                          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                          dropdownColor: Colors.white,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedDollarType = newValue!;
                              // Recalcular la conversión al cambiar el tipo de dólar
                              if (currency == "dolar") {
                                result = (inputValue * selectedDollarRate).toStringAsFixed(2);
                              } else {
                                result = (inputValue / selectedDollarRate).toStringAsFixed(2);
                              }
                            });
                          },
                          items: dollarTypes.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyle(color: Colors.black)),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),

              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              inputValue = double.tryParse(value) ?? 0.0;
                              if (currency == "dolar") {
                                result = (inputValue * selectedDollarRate).toStringAsFixed(2);
                              } else {
                                result = (inputValue / selectedDollarRate).toStringAsFixed(2);
                              }
                            });
                          } else {
                            setState(() {
                              result = "0.00";
                              inputValue = 0.0;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: localizationService.translate('valorAConvertir'), // Use the translation key here
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(value1),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (currency == "dolar") {
                                  currency = "peso";
                                  value1 = localizationService.translate('pesoARS'); // Use the translation key here
                                  value2 = localizationService.translate('dolarUSD'); // Use the translation key here
                                  result = (inputValue / selectedDollarRate).toStringAsFixed(2); // Recálculo al cambiar el sentido
                                } else if (currency == "peso") {
                                  currency = "dolar";
                                  value1 = localizationService.translate('dolarUSD'); // Use the translation key here
                                  value2 = localizationService.translate('pesoARS'); // Use the translation key here
                                  result = (inputValue * selectedDollarRate).toStringAsFixed(2); // Recálculo al cambiar el sentido
                                }
                              });
                            },
                            child: Icon(Icons.swap_horiz),
                            elevation: 0.0,
                          ),
                          Text(value2),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          children: [
                            Text(
                              localizationService.translate('resultado'), // Use the translation key here
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              result,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
