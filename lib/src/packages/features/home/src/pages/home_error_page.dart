import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftf_github_api/src/packages/features/home/home.dart';

class HomeErrorPage extends StatelessWidget {
  const HomeErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Something went wrong. Please try again.'),
          ElevatedButton(
            onPressed: () =>
                context.read<HomeBloc>().add(const GetCommitsEvent()),
            child: const Text('Try again.'),
          )
        ],
      ),
    );
  }
}
