//import mockito
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talenti_test/features/domain/entities/character.dart';
import 'package:talenti_test/features/domain/entities/location.dart';
import 'package:talenti_test/features/domain/repositories/character_repository.dart';
import 'package:talenti_test/features/domain/usecases/get_character_use_case.dart';

class MockCaracterRepository extends Mock implements CharacterRepository {}

void main() {
  late GetCharacterUseCase useCase;
  late MockCaracterRepository mockCharacterRepository;
  const int numPage = 1;
  //create Character value
  const List<Character> characters = [
    Character(
      id: 1,
      name: "Rick",
      status: "status",
      type: "type",
      gender: "gender",
      species: "species",
      origin: "origin",
      image: "image",
      location: Location(name: "name", url: 'url'),
      episode: ["episode"],
    )
  ];
  setUp(() {
    mockCharacterRepository = MockCaracterRepository();
    useCase = GetCharacterUseCase(mockCharacterRepository);
  });

  test(
    'should get caracter for the page from the repository',
    () async {
      //arrange
      when(mockCharacterRepository.fetchCharacters(numPage))
          .thenAnswer((_) async => const Right(characters));
      //act
      final result = await useCase(const Params(page: numPage));
      //assert
      expect(result, const Right(characters));
      verify(mockCharacterRepository.fetchCharacters(1));
      verifyNoMoreInteractions(mockCharacterRepository);
    },
  );
}
