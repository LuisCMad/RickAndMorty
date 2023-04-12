import 'package:dartz/dartz.dart';
import 'package:talenti_test/core/error/failures.dart';
import 'package:talenti_test/features/data/datasources/episodeRemoteDataSource.dart';
import 'package:talenti_test/features/domain/entities/episode.dart';
import 'package:talenti_test/features/domain/repositories/episode_repository.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  EpisodeRemoteDataSource dataSource;

  EpisodeRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<Episode>>> fetchEpisodes(int page) async {
    try {
      final List<Episode> episodes = await dataSource.getEpisodes(page);
      return Right(episodes);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
