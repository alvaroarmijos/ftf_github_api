import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ftf_github_api/src/packages/data/catalog/catalog.dart';
import 'package:ftf_github_api/src/packages/features/home/src/widgets/home_content.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('should render a Empty List View', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: HomeContent(
          commits: [],
        ),
      ),
    );

    expect(find.byType(RefreshIndicator), findsOne);
    expect(find.byType(ListView), findsOne);
    expect(find.byType(Card), findsNothing);
  });

  testWidgets('should render a List View', (widgetTester) async {
    final commits = [Commit.empty];

    await mockNetworkImagesFor(
      () => widgetTester.pumpWidget(
        MaterialApp(
          home: HomeContent(
            commits: commits,
          ),
        ),
      ),
    );

    expect(find.byType(RefreshIndicator), findsOne);
    expect(find.byType(ListView), findsOne);
    expect(find.byType(Card), findsOne);
    expect(find.byType(CircleAvatar), findsOne);
  });
}
