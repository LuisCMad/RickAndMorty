part of 'search_character_bloc.dart';

@freezed
class SearchCharacterState with _$SearchCharacterState {
  const factory SearchCharacterState.initial() = _Initial;

  const factory SearchCharacterState.loading() = _Loading;

  const factory SearchCharacterState.loaded(List<Character> characters) =
      _Loaded;

  const factory SearchCharacterState.error() = _Error;
}
