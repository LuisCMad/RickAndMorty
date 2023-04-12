//import dartz
import 'package:dartz/dartz.dart';
import 'package:talenti_test/core/error/failures.dart';
import 'package:talenti_test/features/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<Character>>> fetchCharacters(int page);
  Future<Either<Failure, List<Character>>> searchCharacters(String query);
}
