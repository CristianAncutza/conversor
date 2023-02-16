import 'package:conversorapp/pages/tabs_page.dart';
import 'package:conversorapp/services/conversor_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            // ignore: unnecessary_new
            create: (_) => new ConvertService()),
      ],
      child: MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          home: TabsPage()),
    );
  }
}
