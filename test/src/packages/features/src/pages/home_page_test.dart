import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ftf_github_api/src/packages/features/home/home.dart';
import 'package:ftf_github_api/src/packages/features/home/src/pages/pages.dart';
import 'package:ftf_github_api/src/packages/features/home/src/widgets/home_content.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
  });

  Widget homePage = BlocProvider<HomeBloc>(
    create: (context) => mockHomeBloc,
    child: const MaterialApp(
      home: HomePage(),
    ),
  );

  group('Home page', () {
    testWidgets('should render success view ', (widgetTester) async {
      when(() => mockHomeBloc.state).thenReturn(
        const HomeSuccess([]),
      );

      await widgetTester.pumpWidget(homePage);

      expect(find.text('FTF GitHub API'), findsOne);
      expect(find.byType(HomeContent), findsOne);
    });

    testWidgets('should render loading view ', (widgetTester) async {
      when(() => mockHomeBloc.state).thenReturn(
        const HomeLoading(),
      );

      await widgetTester.pumpWidget(homePage);

      expect(find.text('FTF GitHub API'), findsOne);
      expect(find.byType(HomeLoadingPage), findsOne);
    });

    testWidgets('should render error view ', (widgetTester) async {
      when(() => mockHomeBloc.state).thenReturn(
        const HomeError(),
      );

      await widgetTester.pumpWidget(homePage);

      expect(find.text('FTF GitHub API'), findsOne);
      expect(find.byType(HomeErrorPage), findsOne);
    });
  });
}
