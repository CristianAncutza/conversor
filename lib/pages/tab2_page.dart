import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/convert_model.dart';
import '../services/conversor_service.dart';

class Tab2Page extends StatefulWidget {
  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final List<Casa> cotizaciones = [];
    final headlines = Provider.of<ConvertService>(context);
    print('prueba de cotizaciones 2');
    print(headlines);
    return Scaffold(
        body: (headlines == 0)
            ? Center(child: CircularProgressIndicator())
            : null);
  }

  @override
  bool get wantKeepAlive => true;
}
