import 'package:ftf_github_api/src/packages/features/home/src/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> init(GetIt sl) async {
  sl.registerFactory(() => HomeBloc(sl()));
}
