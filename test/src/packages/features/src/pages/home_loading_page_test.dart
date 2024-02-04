import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ftf_github_api/src/packages/features/home/src/pages/pages.dart';

void main() {
  testWidgets('should render a Loading page', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: HomeLoadingPage(),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOne);
  });
}
