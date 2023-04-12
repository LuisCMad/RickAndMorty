import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talenti_test/core/error/failures.dart';
import 'package:talenti_test/features/domain/entities/character.dart';
import 'package:talenti_test/features/domain/usecases/get_character_use_case.dart';

part 'character_state.dart';

part 'character_event.dart';

part 'character_bloc.freezed.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacterUseCase getCharacter;

  CharacterBloc({required GetCharacterUseCase getCharacterUseCase})
      : assert(getCharacterUseCase != null),
        getCharacter = getCharacterUseCase,
        super(const CharacterState.initial()) {
    on<CharacterEvent>((event, emit) async {
      await event.map(
        started: (e) async {
          emit(const CharacterState.initial());
        },
        fetchCharacter: (e) async {
          emit(const CharacterState.loading());
          final Either<Failure, List<Character>> response =
              await getCharacter(Params(page: e.page));
          response.fold(
            (l) => emit(
              const CharacterState.error(),
            ),
            (r) {
              emit(
                CharacterState.loaded(r),
              );
            },
          );
        },
      );
    });
  }
}
