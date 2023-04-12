import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talenti_test/core/error/failures.dart';
import 'package:talenti_test/features/domain/entities/character.dart';
import 'package:talenti_test/features/domain/usecases/search_character_use_case.dart';

part 'search_character_event.dart';

part 'search_character_state.dart';

part 'search_character_bloc.freezed.dart';

class SearchCharacterBloc
    extends Bloc<SearchCharacterEvent, SearchCharacterState> {
  final SearchEpisodeUseCase searchCharacter;

  SearchCharacterBloc({required SearchEpisodeUseCase searchEpisodeUseCase})
      : assert(searchEpisodeUseCase != null),
        searchCharacter = searchEpisodeUseCase,
        super(const SearchCharacterState.initial()) {
    on<SearchCharacterEvent>((event, emit) async {
      await event.map(
        started: (e) async {
          emit(const SearchCharacterState.initial());
        },
        searchCharacter: (e) async {
          emit(const SearchCharacterState.loading());
          final Either<Failure, List<Character>> response =
              await searchCharacter(Params(query: e.query));
          response.fold(
            (l) => emit(
              const SearchCharacterState.error(),
            ),
            (r) {
              emit(
                SearchCharacterState.loaded(r),
              );
            },
          );
        },
      );
    });
  }
}
