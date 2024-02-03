import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftf_github_api/src/packages/data/catalog/catalog.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getAllCommits,
  ) : super(const HomeLoading()) {
    on<GetCommitsEvent>(_onGetCommitsEvent);
  }

  final GetAllCommits _getAllCommits;

  FutureOr<void> _onGetCommitsEvent(
    GetCommitsEvent event,
    Emitter<HomeState> emit,
  ) {
    return emit.forEach(
      _getAllCommits(),
      onData: (commits) => HomeSuccess(commits),
      onError: (_, __) => const HomeError(),
    );
  }
}
