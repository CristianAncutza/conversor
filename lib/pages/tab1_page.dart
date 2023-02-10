import 'package:conversorapp/models/convert_model.dart';
import 'package:conversorapp/services/conversor_service.dart';
import 'package:conversorapp/widgets/lista_cotizaciones.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final List<Casa> cotizaciones = [];
    final headlines = Provider.of<ConvertService>(context);

    print(headlines);
    return Scaffold(
        body: (headlines == 0)
            ? Center(child: CircularProgressIndicator())
            : ListaCotizaciones(cotizaciones));
  }

  @override
  bool get wantKeepAlive => true;
}


/*class tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return const Scaffold(
      body: Center(
        child: Text('Hola perro'),
      ),
    );
  }
}*/
