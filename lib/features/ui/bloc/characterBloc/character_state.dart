part of 'character_bloc.dart';

@freezed
class CharacterState with _$CharacterState {
  const factory CharacterState.initial() = _Initial;
  const factory CharacterState.loading() = _Loading;
  const factory CharacterState.loaded(List<Character> listCharacter) = _Loaded;
  const factory CharacterState.error() = _Error;

}
