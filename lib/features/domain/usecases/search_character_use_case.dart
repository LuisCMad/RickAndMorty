import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:talenti_test/core/error/failures.dart';
import 'package:talenti_test/core/usecases/usecase.dart';
import 'package:talenti_test/features/domain/entities/character.dart';
import 'package:talenti_test/features/domain/repositories/character_repository.dart';

class SearchEpisodeUseCase implements UseCase<List<Character>, Params> {
  final CharacterRepository repository;

  SearchEpisodeUseCase(this.repository);

  @override
  Future<Either<Failure, List<Character>>> call(Params params) async {
    return await repository.searchCharacters(params.query);
  }
}

class Params extends Equatable {
  final String query;

  const Params({required this.query});

  @override
  List<Object?> get props => [query];
}
