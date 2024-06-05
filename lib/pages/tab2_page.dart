import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/conversor_service.dart';

// PANTALLA CONVERSOR
class Tab2Page extends StatefulWidget {
  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page> with AutomaticKeepAliveClientMixin {
  String result = "0.00";
  String currency = "dolar";
  String value1 = "Dolar (USD)";
  String value2 = "Peso (ARS)";

  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<ConvertService>(context);

    // Asegurarse de que dolarblue es un double
    double dolarblue = 0.0;
    if (headlines.rates.isNotEmpty) {
      dolarblue = double.tryParse(headlines.rates[1].venta.toString()) ?? 0.0;
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200.0,
                child: const Text(""),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        // Calculo del resultado de la conversión
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              double parsedValue = double.tryParse(value) ?? 0.0;
                              if (currency == "dolar") {
                                result = (parsedValue * dolarblue).toStringAsFixed(2);
                              } else {
                                result = (parsedValue / dolarblue).toStringAsFixed(2);
                              }
                            });
                          } else {
                            setState(() {
                              result = "0.00";
                            });
                          }
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Valor a convertir",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(value1),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (currency == "dolar") {
                                  currency = "peso";
                                  value1 = "Peso (ARS)";
                                  value2 = "Dolar (USD)";
                                  result = "0.00";
                                } else if (currency == "peso") {
                                  currency = "dolar";
                                  value1 = "Dolar (USD)";
                                  value2 = "Peso (ARS)";
                                  result = "0.00";
                                }
                              });
                            },
                            child: Icon(Icons.swap_horiz),
                            elevation: 0.0,
                          ),
                          Text(value2),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "Resultado",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              result,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
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
