import 'package:conversorapp/pages/tab3_page.dart';
import 'package:conversorapp/pages/tabs_page.dart';
import 'package:conversorapp/services/conversor_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:conversorapp/services/localization_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalizationService localizationService = await LocalizationService.load('es'); // Idioma predeterminado

  runApp(MyApp(localizationService: localizationService));
}

class MyApp extends StatelessWidget {
  final LocalizationService localizationService;

  MyApp({required this.localizationService});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConvertService()),
        Provider(create: (_) => localizationService),
      ],
      child: Consumer<LocalizationService>(
        builder: (context, localizationService, child) {
          return MaterialApp(
            title: localizationService.translate('appTitle'),
            debugShowCheckedModeBanner: false,
            home: TabsPage(),
            theme: ThemeData.dark()
                .copyWith(appBarTheme: AppBarTheme(color: Colors.indigo)),
            routes: {
              '/grafico': (context) => EvolutionChart(
                EvolutionChart.createSampleData(),
              ),
            },
          );
        },
      ),
    );
  }
}
