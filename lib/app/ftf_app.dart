import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftf_github_api/src/packages/features/home/home.dart';

import 'di/di.dart';

class FtfApp extends StatelessWidget {
  const FtfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FTF App',
      home: BlocProvider(
        create: (context) => sl<HomeBloc>(),
        child: const HomePage(),
      ),
    );
  }
}
