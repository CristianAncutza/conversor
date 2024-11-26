import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:conversorapp/main.dart';
import 'package:conversorapp/services/localization_service.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Cargar el servicio de localización
    LocalizationService localizationService = await LocalizationService.load('es');

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(localizationService: localizationService));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
