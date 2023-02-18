import 'package:conversorapp/models/convert_model.dart';
import 'package:conversorapp/services/conversor_service.dart';
import 'package:conversorapp/widgets/lista_cotizaciones.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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
    final _rates = RatesDataSource(headlines);
    return SafeArea(
        child: Scaffold(
      body: SfDataGrid(
        source: _rates,
        columns: [
          // ignore: deprecated_member_use
          GridTextColumn(
              columnName: 'nombre',
              label: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    'nombre',
                    overflow: TextOverflow.ellipsis,
                  ))),
          // ignore: deprecated_member_use
          GridTextColumn(
              columnName: 'compra',
              label: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    'compra',
                    overflow: TextOverflow.ellipsis,
                  ))),
          // ignore: deprecated_member_use
          GridTextColumn(
              columnName: 'venta',
              label: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    'venta',
                    overflow: TextOverflow.ellipsis,
                  )))
        ],
      ),
    ));
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

class RatesDataSource extends DataGridSource {
  RatesDataSource(List<ConvertResponse> rates) {
    dataGridRows = rates
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'nombre', value: dataGridRow.casa.nombre),
              DataGridCell<String>(
                  columnName: 'compra', value: dataGridRow.casa.compra),
              DataGridCell<String>(
                  columnName: 'compra', value: dataGridRow.casa.venta),
            ]))
        .toList();
  }
  late List<DataGridRow> dataGridRows;
  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        child: Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
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
