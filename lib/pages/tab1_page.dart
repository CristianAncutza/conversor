import 'package:conversorapp/services/conversor_service.dart';
import 'package:conversorapp/widgets/lista_cotizaciones.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:syncfusion_flutter_datagrid';

//PANTALLA COTIZACIONES
class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<ConvertService>(context).rates;

    //return Scaffold(body: ListaCotizaciones(headlines));
    /*return const Scaffold(
      body: Center(
        child: Text("test"),
      ),
    );*/
  }

  @override
  bool get wantKeepAlive => true;
}
/*
class tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final convertService = Provider.of<ConvertService>(context);

    return const Scaffold(
      body: Center(
        child: Text('Hola perro'),
      ),
    );
  }
}*/
