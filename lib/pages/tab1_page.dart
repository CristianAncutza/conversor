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
          highlightRowOnHover: true,
          //columnWidthMode: ColumnWidthMode.auto,
          columnWidthCalculationRange: ColumnWidthCalculationRange.allRows,
          //columnWidthMode: ColumnWidthMode.lastColumnFill,
          //selectionMode: SelectionMode.multiple,
          source: _rates,
          allowSorting: true,
          columns: [
            // ignore: deprecated_member_use
            GridTextColumn(
                columnName: 'nombre',
                autoFitPadding: EdgeInsets.all(10.0),
                label: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'Nombre',
                      overflow: TextOverflow.ellipsis,
                    ))),
            // ignore: deprecated_member_use
            GridTextColumn(
                columnName: 'compra',
                autoFitPadding: EdgeInsets.all(10.0),
                label: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'Compra',
                      overflow: TextOverflow.ellipsis,
                    ))),
            // ignore: deprecated_member_use
            GridTextColumn(
                columnName: 'venta',
                autoFitPadding: EdgeInsets.all(10.0),
                label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'Venta',
                      overflow: TextOverflow.ellipsis,
                    )))
          ],
          //CABECERA
          /*stackedHeaderRows: <StackedHeaderRow>[
            StackedHeaderRow(cells: [
              StackedHeaderCell(
                  columnNames: ['nombre', 'compra', 'venta'],
                  child: Container(
                      color: Color.fromARGB(255, 33, 74, 38),
                      child: Center(child: Text('Cotizaciones')))),
            ]),
          ],*/
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.both),
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
                  columnName: 'venta', value: dataGridRow.casa.venta),
            ]))
        .toList();
  }
  late List<DataGridRow> dataGridRows;
  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        color: const Color.fromARGB(255, 49, 84, 51),
        cells: row.getCells().map<Widget>((dataGridCell) {
          TextStyle? getTextStyle() {
            if (dataGridCell.columnName == 'compra') {
              return const TextStyle(color: Color.fromARGB(255, 179, 53, 53));
            } else {
              return null;
            }
          }

          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: Text(
              dataGridCell.value.toString(),
              style: getTextStyle(),
            ),
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
