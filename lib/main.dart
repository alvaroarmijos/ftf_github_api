import 'package:flutter/material.dart';
import 'package:ftf_github_api/app/ftf_app.dart';

import 'app/di/di.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const FtfApp();
  }
}
