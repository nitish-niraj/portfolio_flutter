import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nitish_kumar_portfolio/main.dart';

void main() {
  testWidgets('Portfolio app smoke test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(NitishKumarPortfolio());

    // Verify that the app builds without errors.
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
