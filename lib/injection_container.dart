import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:talenti_test/features/data/datasources/characterRemoteDataSource.dart';
import 'package:talenti_test/features/data/datasources/episodeRemoteDataSource.dart';
import 'package:talenti_test/features/data/repositories/character_repository_imp.dart';
import 'package:talenti_test/features/data/repositories/episode_repository_imp.dart';
import 'package:talenti_test/features/domain/repositories/character_repository.dart';
import 'package:talenti_test/features/domain/repositories/episode_repository.dart';
import 'package:talenti_test/features/domain/usecases/get_character_use_case.dart';
import 'package:talenti_test/features/domain/usecases/get_episode_use_case.dart';
import 'package:talenti_test/features/domain/usecases/search_character_use_case.dart';
import 'package:talenti_test/features/ui/bloc/characterBloc/character_bloc.dart';
import 'package:talenti_test/features/ui/bloc/episodeBloc/episode_bloc.dart';
import 'package:talenti_test/features/ui/bloc/searchCharacter/search_character_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features -
  // Bloc
  sl.registerFactory(() => CharacterBloc(
        getCharacterUseCase: sl(),
      ));
  sl.registerFactory(() => EpisodeBloc(
        getEpisodeUseCase: sl(),
      ));
  sl.registerFactory(() => SearchCharacterBloc(
        searchEpisodeUseCase: sl(),
      ));
  // Use cases
  sl.registerLazySingleton(() => GetCharacterUseCase(sl()));
  sl.registerLazySingleton(() => GetEpisodeUseCase(sl()));
  sl.registerLazySingleton(() => SearchEpisodeUseCase(sl()));
  // Repository
  sl.registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImpl(dataSource: sl()));
  sl.registerLazySingleton<EpisodeRepository>(
      () => EpisodeRepositoryImpl(dataSource: sl()));
  // Data sources
  sl.registerLazySingleton<CharacterRemoteDataSource>(
      () => CharacterRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<EpisodeRemoteDataSource>(
      () => EpisodeRemoteDataSourceImpl(client: sl()));
  //External injection
  sl.registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com')));
}
