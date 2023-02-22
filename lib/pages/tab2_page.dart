//import 'package:conversorapp/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import '../models/convert_model.dart';
import '../services/conversor_service.dart';

//PANTALLA CONVERSOR
class Tab2Page extends StatefulWidget {
  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page>
    with AutomaticKeepAliveClientMixin {
  String result = "_";
  @override
  Widget build(BuildContext context) {
    //final List<Casa> cotizaciones = [];
    //List<String> currencies;
    //String from;
    //String to;
    //variables para el exchange rate
    //var rate;

    //String currency = "";
    final headlines = Provider.of<ConvertService>(context);
    print("dolar oficial");
    var dolaroficial = headlines.rates.first.casa.compra;
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200.0,
                      child: const Text(
                        "Conversor",
                      ),
                    ),
                    Expanded(
                        child: Center(
                            child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          //calculo del resultado de la conversion
                          onChanged: (value) {
                            //Dolares a pesos
                            //if (currency == "Dolar (USD)") {
                            if (value != "" || value.isNotEmpty) {
                              setState(() {
                                result = (double.parse(value) *
                                        double.parse(
                                            dolaroficial.replaceAll(',', '.')))
                                    .toStringAsFixed(2);
                              });
                            } else {
                              setState(() {
                                result = "_";
                              });
                            }
                            //Pesos a dolares
                            /*setState(() {
                              result =
                                  (double.parse(rate) * double.parse(value))
                                      .toStringAsFixed(2);
                            });*/
                            /*}else if(currency == "Peso (ARS)"){
                              rate = ConvertResponse(casa: casa).casa.venta;
                              setState(() {
                                result = (double.parse(rate) / double.parse(value))
                                    .toStringAsFixed(3);
                              });*/
                          },
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Valor a convertir",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                              )),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Dolar (USD)"),

                            //customDropDown(currencies, from, (from) {
                            //setState(){
                            //from = val;}
                            //})
                            FloatingActionButton(
                              onPressed: () {},
                              child: Icon(Icons.swap_horiz),
                              elevation: 0.0,
                            ),
                            const Text("Peso (ARS)"),
                            //customDropDown(currencies, from, (from) {
                            //setState(){
                            //from = val;}
                            //})
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
                          child: Column(children: [
                            const Text(
                              "Resultado",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(result,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ]),
                        )
                      ],
                    )))
                  ],
                ))));
  }

  @override
  bool get wantKeepAlive => true;
}
