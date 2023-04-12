import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:talenti_test/core/error/failures.dart';
import 'package:talenti_test/core/usecases/usecase.dart';
import 'package:talenti_test/features/domain/entities/episode.dart';
import 'package:talenti_test/features/domain/repositories/episode_repository.dart';

class GetEpisodeUseCase implements UseCase<List<Episode>, Params> {
  final EpisodeRepository repository;

  GetEpisodeUseCase(this.repository);

  @override
  Future<Either<Failure, List<Episode>>> call(Params params) async {
    return await repository.fetchEpisodes(params.page);
  }
}

class Params extends Equatable {
  final int page;

  const Params({required this.page});

  @override
  List<Object?> get props => [page];
}
