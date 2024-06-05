import 'package:conversorapp/models/convert_model.dart';
import 'package:conversorapp/services/conversor_service.dart';
//import 'package:conversorapp/widgets/lista_cotizaciones.dart';
import 'package:syncfusion_flutter_core/theme.dart';
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
    if(headlines.length > 0 && headlines.length == 9){
      /*if(headlines[7].casa.nombre == "Dolar" && headlines[8].casa.nombre == "Argentina"){
        headlines.removeAt(7);
        headlines.removeAt(7);
      }*/
    }
    final _rates = RatesDataSource(headlines);
    
    if(_rates.rows.length == 0){
      Future.delayed(Duration.zero,(){
      showDialog(                  
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(              
              title: Text('Atención!', textAlign: TextAlign.center),
              content: Text('No hay comunicación con el servidor, revise su conexión a internet o pruebe mas tarde.'),              
              actions: [                
                TextButton(onPressed: () {
                            Navigator.of(context).pop();
                },                 
                child: Text('OK'))
              ],
              
            );
      });
      });
    }

    return SafeArea(
        child: Scaffold(
            body: SfDataGridTheme(
      data: SfDataGridThemeData(headerColor: const Color(0xff009889)),
      child: SfDataGrid(
          //columnWidthMode: ColumnWidthMode.none,
          //selectionMode: SelectionMode.multiple,
          //highlightRowOnHover: true,
          columnWidthMode: ColumnWidthMode.fill,
          rowHeight: 100,
          columnWidthCalculationRange: ColumnWidthCalculationRange.allRows,
          source: _rates,
          allowSorting: true,
          columns: [
            // ignore: deprecated_member_use
            GridTextColumn(
                columnName: 'nombre',
                autoFitPadding: EdgeInsets.all(10.0),
                label: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    alignment: Alignment.center,
                    child: const Text('Nombre',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20)))),
            // ignore: deprecated_member_use
            GridTextColumn(
                columnName: 'compra',
                autoFitPadding: EdgeInsets.all(10.0),
                label: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    alignment: Alignment.center,
                    child: const Text('Compra',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20)))),
            // ignore: deprecated_member_use
            GridTextColumn(
                columnName: 'venta',
                autoFitPadding: EdgeInsets.all(10.0),
                label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    alignment: Alignment.center,
                    child: const Text('Venta',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20))))
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
    )));
  }

  @override
  bool get wantKeepAlive => true;
}

class RatesDataSource extends DataGridSource {
  RatesDataSource(List<Convert> rates) {
    dataGridRows = rates
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'nombre', value: dataGridRow.nombre),
              DataGridCell<String>(
                  columnName: 'compra',
                  value: dataGridRow.compra.toString(),), /*!= "No Cotiza" ? double.parse( dataGridRow.compra.replaceAll('.','').replaceAll(',', '.')).toStringAsFixed(2): dataGridRow.casa.compra),*/
              DataGridCell<String>(
                  columnName: 'venta',
                  value: dataGridRow.venta.toString(),), /*!= "No Cotiza" && dataGridRow.nombre != "Bitcoin" && dataGridRow.casa.venta != "0" ? double.parse(dataGridRow.casa.venta.replaceAll('.','').replaceAll(',', '.')).toStringAsFixed(2) : "No Cotiza"),*/
            ]))
        .toList();
  }
  late List<DataGridRow> dataGridRows;
  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        //color: const Color.fromARGB(255, 49, 84, 51),
        cells: row.getCells().map<Widget>((dataGridCell) {
      TextStyle? getTextStyle() {
        if (dataGridCell.columnName == 'compra') {
          return const TextStyle(
              color: Color.fromARGB(133, 105, 240, 175), fontSize: 20);
        } else {
          return const TextStyle(fontSize: 20);
        }
      }

      return Container(
        alignment: Alignment.center,
        //padding: EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(237, 52, 51, 51),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(133, 105, 240, 175),
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ), //BoxShadow
            BoxShadow(
              //color: Color.fromARGB(255, 74, 73, 73),
              offset: const Offset(0.0, 0.0),
              blurRadius: 2.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          //borderRadius: BorderRadius.circular(16.0),
        ),
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
