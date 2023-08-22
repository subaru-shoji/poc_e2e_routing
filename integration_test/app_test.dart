import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poc_e2e_routing/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('move route by context', (tester) async {
      const myApp = MyApp();
      await tester.pumpWidget(myApp);

      await Future.delayed(const Duration(seconds: 3));

      final button = find.text('Go to the Details screen');
      expect(button, findsOneWidget);

      final context = getBuildContext(tester);
      context.go('/details');

      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 3));

      expect(find.text('Go back to the Home screen'), findsOneWidget);
    });
  });
}

BuildContext getBuildContext(WidgetTester tester) {
  return tester.element(find.byType(Scaffold));
}
