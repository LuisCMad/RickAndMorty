import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talenti_test/core/error/failures.dart';
import 'package:talenti_test/features/domain/entities/episode.dart';
import 'package:talenti_test/features/domain/usecases/get_episode_use_case.dart';

part 'episode_event.dart';

part 'episode_state.dart';

part 'episode_bloc.freezed.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final GetEpisodeUseCase getEpisode;

  EpisodeBloc({required GetEpisodeUseCase getEpisodeUseCase})
      : assert(getEpisodeUseCase != null),
        getEpisode = getEpisodeUseCase,
        super(const EpisodeState.initial()) {
    on<EpisodeEvent>((event, emit) async {
      await event.map(
        started: (e) async {
          emit(const EpisodeState.initial());
        },
        fetchEpisode: (e) async {
          emit(const EpisodeState.loading());
          final Either<Failure, List<Episode>> response =
              await getEpisode(Params(page: e.page));
          response.fold(
              (l) => emit(
                    const EpisodeState.error(),
                  ), (r) {
            emit(
              EpisodeState.loaded(r),
            );
          });
        },
      );
    });
  }
}
