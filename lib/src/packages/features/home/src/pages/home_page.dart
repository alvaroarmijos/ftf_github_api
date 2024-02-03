import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftf_github_api/src/packages/features/home/home.dart';

import '../widgets/home_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(const GetCommitsEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text('FTF GitHub API'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return switch (state) {
            HomeLoading() || HomeError() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            HomeSuccess(commits: final commits) =>
              HomeContent(commits: commits),
          };
        },
      ),
    );
  }
}
