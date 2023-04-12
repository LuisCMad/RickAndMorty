import 'package:dio/dio.dart';
import 'package:talenti_test/core/error/failures.dart';
import 'package:talenti_test/features/domain/entities/episode.dart';

abstract class EpisodeRemoteDataSource {
  Future<List<Episode>> getEpisodes(int id);
}

class EpisodeRemoteDataSourceImpl implements EpisodeRemoteDataSource {
  final Dio client;

  EpisodeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Episode>> getEpisodes(int page) => _getEpisodesFromUrl(
        '/api/episode',
        {
          "page": page,
        },
      );

  Future<List<Episode>> _getEpisodesFromUrl(
      String route, Map<String, dynamic> params) async {
    try {
      final response = await client.get(route, queryParameters: params);
      if (response.statusCode == 200) {
        final List<Episode> characters =
            getEpisodesFromJson(response.data["results"]);
        return characters;
      } else {
        throw ServerFailure();
      }
    } on DioError catch (e) {
      throw ServerFailure();
    }
  }

  List<Episode> getEpisodesFromJson(data) {
    List<Episode> episodes = [];
    for (var item in data) {
      episodes.add(Episode.fromJson(item));
    }
    return episodes;
  }
}
