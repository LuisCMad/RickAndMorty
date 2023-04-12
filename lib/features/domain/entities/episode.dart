import 'package:equatable/equatable.dart';

//class equatable Episode with values : id, name, air_date, episode, characters, url, created.
class Episode extends Equatable {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final String created;

  const Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        airDate,
        episode,
        characters,
        url,
        created,
      ];

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'],
      name: json['name'],
      airDate: json['air_date'],
      episode: json['episode'],
      characters: List<String>.from(json['characters']),
      url: json['url'],
      created: json['created'],
    );
  }
}
