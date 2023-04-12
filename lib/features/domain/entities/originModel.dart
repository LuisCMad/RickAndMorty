import 'package:equatable/equatable.dart';

class OriginModel extends Equatable {
  final String name;
  final String url;

  const OriginModel({
    required this.name,
    required this.url,
  });

  factory OriginModel.fromJson(Map<String, dynamic> json) {
    return OriginModel(
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  List<Object?> get props => [name, url];
}
