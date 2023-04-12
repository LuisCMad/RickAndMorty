part of 'character_bloc.dart';

@freezed
class CharacterEvent with _$CharacterEvent {
  const factory CharacterEvent.started() = _Started;

  const factory CharacterEvent.fetchCharacter(int page) = _FetchCharacter;
}
