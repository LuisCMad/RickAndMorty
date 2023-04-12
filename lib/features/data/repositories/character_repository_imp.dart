import 'package:dartz/dartz.dart';
import 'package:talenti_test/core/error/failures.dart';
import 'package:talenti_test/features/data/datasources/characterRemoteDataSource.dart';
import 'package:talenti_test/features/domain/entities/character.dart';

import '../../domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  CharacterRemoteDataSource dataSource;

  CharacterRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<Character>>> fetchCharacters(int page) async {
    try {
      final List<Character> characters = await dataSource.getCharacters(page);
      return Right(characters);
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Character>>> searchCharacters(
      String query) async {
    try {
      final List<Character> characters =
          await dataSource.searchCharacters(query);
      return Right(characters);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
