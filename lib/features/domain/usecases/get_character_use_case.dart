import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:talenti_test/core/error/failures.dart';
import 'package:talenti_test/core/usecases/usecase.dart';
import 'package:talenti_test/features/domain/entities/character.dart';
import 'package:talenti_test/features/domain/repositories/character_repository.dart';

class GetCharacterUseCase implements UseCase<List<Character>, Params> {
  final CharacterRepository repository;

  GetCharacterUseCase(this.repository);

  @override
  Future<Either<Failure, List<Character>>> call(Params params) async {
    return await repository.fetchCharacters(params.page);
  }
}

class Params extends Equatable {
  final int page;

  const Params({required this.page});

  @override
  List<Object?> get props => [page];
}
