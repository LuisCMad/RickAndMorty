import 'package:dartz/dartz.dart';
import 'package:talenti_test/core/error/failures.dart';
import 'package:talenti_test/features/domain/entities/episode.dart';

abstract class EpisodeRepository {
  Future<Either<Failure, List<Episode>>> fetchEpisodes(int page);
}
