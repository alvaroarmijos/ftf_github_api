import 'package:ftf_github_api/src/packages/data/catalog/catalog.dart'
    as catalog;
import 'package:ftf_github_api/src/packages/features/home/home.dart' as home;
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  await catalog.init(sl);
  await home.init(sl);

  sl.registerLazySingleton(() => http.Client());
}
