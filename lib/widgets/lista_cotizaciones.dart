import 'package:flutter/material.dart';

import '../models/convert_model.dart';

class ListaCotizaciones extends StatelessWidget {
  final List<Convert> cotizaciones;

  const ListaCotizaciones(this.cotizaciones);

  @override
  Widget build(BuildContext context) {
    print("lista cotizaciones prueba");
    print(this.cotizaciones);
    return ListView.builder(
        itemCount: this.cotizaciones.length,
        itemBuilder: (BuildContext context, int index) {
          return _Cotizacion(
              cotizacion: this.cotizaciones[index], index: index);
        });
  }
}

class _Cotizacion extends StatelessWidget {
  final Convert cotizacion;

  final int index;

  const _Cotizacion({required this.cotizacion, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // _TarjetaTopBar(cotizacion, index),
        // _TarjetaTitulo(cotizacion),
        // _TarjetaImagen(cotizacion),
        _TarjetaBody(cotizacion),
        //_TarjetaBotones(),
        SizedBox(height: 10),
        Divider(),
      ],
    );
  }
}

// ignore: unused_element
class _TarjetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border),
          ),
          SizedBox(width: 10),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}

//tarjetaBody
class _TarjetaBody extends StatelessWidget {
  final Convert cotizacion;

  const _TarjetaBody(this.cotizacion);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text((cotizacion.venta.toString())));
  }
}



/*class _TarjetaImagen extends StatelessWidget {
  final Casa noticia;

  const _TarjetaImagen(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (noticia.urlToImage != null)
                ? FadeInImage(
                    placeholder: AssetImage('assets/img/giphy.gif'),
                    image: NetworkImage(noticia.urlToImage ?? ''))
                : Image(
                    image: AssetImage('assets/img/no-image.png'),
                  )),
      ),
    );
  }
}*/

/*class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetaTitulo(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        noticia.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}. ',
          ),
          Text('${noticia.source.name}. '),
        ],
      ),
    );
  }
}*/
