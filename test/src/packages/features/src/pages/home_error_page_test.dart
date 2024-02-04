import 'dart:ffi';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ftf_github_api/src/packages/features/home/home.dart';
import 'package:ftf_github_api/src/packages/features/home/src/pages/home_error_page.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
  });
  testWidgets('should render a Error page', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: HomeErrorPage(),
      ),
    );

    expect(find.text('Something went wrong. Please try again.'), findsOne);
    expect(find.byType(ElevatedButton), findsOne);
  });

  testWidgets('should add a GetCommitsEvent', (widgetTester) async {
    when(() => mockHomeBloc.add(const GetCommitsEvent())).thenReturn(Void);

    await widgetTester.pumpWidget(BlocProvider<HomeBloc>(
      create: (context) => mockHomeBloc,
      child: const MaterialApp(
        home: HomeErrorPage(),
      ),
    ));

    var buttonFinder = find.byType(ElevatedButton);
    await widgetTester.tap(buttonFinder);
    await widgetTester.pumpAndSettle(const Duration(seconds: 1));

    verify(
      () => mockHomeBloc.add(const GetCommitsEvent()),
    ).called(1);
  });
}
