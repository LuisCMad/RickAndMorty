part of 'search_character_bloc.dart';

@freezed
class SearchCharacterEvent with _$SearchCharacterEvent {
  const factory SearchCharacterEvent.started() = _Started;

  const factory SearchCharacterEvent.searchCharacter(String query) =
      _SearchCharacter;
}
