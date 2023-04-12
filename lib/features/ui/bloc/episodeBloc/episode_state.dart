part of 'episode_bloc.dart';

@freezed
class EpisodeState with _$EpisodeState {
  const factory EpisodeState.initial() = _Initial;

  const factory EpisodeState.loading() = _Loading;

  const factory EpisodeState.loaded(List<Episode> episode) = _Loaded;

  const factory EpisodeState.error() = _Error;
}
