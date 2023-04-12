import 'package:dartz/dartz.dart';
import 'package:talenti_test/core/error/failures.dart';
import 'package:talenti_test/features/domain/entities/character.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(
    Params params,
  );
}
