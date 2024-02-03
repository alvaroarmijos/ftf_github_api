import 'package:get_it/get_it.dart';

import '../catalog.dart';
import '../src/domain/commit/commit_repository.dart';
import '../src/infrastructure/api_client.dart';
import '../src/infrastructure/commit/commit_mapper.dart';
import '../src/infrastructure/commit/commit_repository_impl.dart';

final sl = GetIt.instance;

void init() async {
  //Use cases
  sl.registerFactory(() => GetAllCommits(sl()));

  // Infrastructure
  //Commits
  sl.registerFactory<CommitRepository>(() => CommitRepositoryImpl(sl(), sl()));
  sl.registerFactory(() => CommitMapper());
  sl.registerFactory(() => CatalogApiClient(sl()));
}
