import 'package:conversorapp/services/news_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/lista_noticias.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;

    return Scaffold(
        body: (headlines.length == 0)
            ? Center(child: CircularProgressIndicator())
            : ListaNoticias(headlines));
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
