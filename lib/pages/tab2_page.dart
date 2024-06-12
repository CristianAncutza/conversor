import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/conversor_service.dart';

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

  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<ConvertService>(context);

    double selectedDollarRate = 0.0;

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
                        color: Colors.white, // Cambio de color a blanco
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedDollarType,
                          icon: Icon(Icons.arrow_drop_down, color: Colors.black), // Color del icono
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                          dropdownColor: Colors.white, // Cambio de color de fondo del menú desplegable
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedDollarType = newValue!;
                            });
                          },
                          items: dollarTypes.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyle(color: Colors.black)), // Color del texto de los elementos
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0), // Separación entre la lista desplegable y los otros elementos

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
                              double parsedValue = double.tryParse(value) ?? 0.0;
                              if (currency == "dolar") {
                                result = (parsedValue * selectedDollarRate).toStringAsFixed(2);
                              } else {
                                result = (parsedValue / selectedDollarRate).toStringAsFixed(2);
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
