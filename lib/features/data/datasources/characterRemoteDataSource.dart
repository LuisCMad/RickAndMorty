import 'package:talenti_test/core/error/failures.dart';
import 'package:talenti_test/features/domain/entities/character.dart';
import 'package:dio/dio.dart';

abstract class CharacterRemoteDataSource {
  Future<List<Character>> getCharacters(int id);

  Future<List<Character>> searchCharacters(String query);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final Dio client;

  CharacterRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Character>> getCharacters(int page) => _getCharacterFromUrl(
        '/api/character',
        {
          "page": page,
        },
      );

  @override
  Future<List<Character>> searchCharacters(String query) =>
      _getCharacterFromUrl(
        '/api/character',
        {
          "name": query,
        },
      );

  Future<List<Character>> _getCharacterFromUrl(
      String route, Map<String, dynamic> params) async {
    try {
      final response = await client.get(route, queryParameters: params);
      if (response.statusCode == 200) {
        final List<Character> characters =
            getCharactersFromJson(response.data["results"]);
        return characters;
      } else {
        throw ServerFailure();
      }
    } on DioError catch (e) {
      throw ServerFailure();
    }
  }

  List<Character> getCharactersFromJson(data) {
    List<Character> characters = [];
    for (var item in data) {
      characters.add(Character.fromJson(item));
    }
    return characters;
  }
}
