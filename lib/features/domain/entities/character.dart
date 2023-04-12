import 'package:equatable/equatable.dart';
import 'package:talenti_test/features/domain/entities/location.dart';
import 'package:talenti_test/features/domain/entities/originModel.dart';

// class equatable caracter with values : id, name, status, type,gender ,species, origin,image, location{name,url},List episode.
class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String type;
  final String gender;
  final String species;
  final String origin;
  final String image;
  final Location location;
  final List<String> episode;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.type,
    required this.gender,
    required this.species,
    required this.origin,
    required this.image,
    required this.location,
    required this.episode,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        type,
        gender,
        species,
        origin,
        image,
        location,
        episode,
      ];

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      type: json['type'],
      gender: json['gender'],
      species: json['species'],
      origin: OriginModel.fromJson(json['origin']).name,
      image: json['image'],
      location: Location.fromJson(json['location']),
      episode: List<String>.from(json['episode']),
    );
  }
}
