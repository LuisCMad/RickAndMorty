import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talenti_test/features/domain/entities/character.dart';
import 'package:talenti_test/features/ui/bloc/characterBloc/character_bloc.dart';
import 'package:talenti_test/features/ui/bloc/searchCharacter/search_character_bloc.dart';
import 'package:talenti_test/features/ui/components/course_card.dart';
import 'package:talenti_test/features/ui/utils/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Character> listCharacter = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2.withOpacity(0.9),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onSubmitted: (value) {
                  context
                      .read<SearchCharacterBloc>()
                      .add(SearchCharacterEvent.searchCharacter(value));
                },
                decoration: InputDecoration(
                  hintText: 'Buscar usuario',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<SearchCharacterBloc, SearchCharacterState>(
                builder: (context, state) {
                  return state.map(
                    initial: (_) => Container(),
                    loading: (_) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (state) {
                      listCharacter = state.characters;
                      return ListView.builder(
                        itemCount: listCharacter.length ~/ 2,
                        itemBuilder: (context, index) {
                          final Character character = listCharacter[index];
                          final resultIndex = index * 2;
                          final result1 = character;
                          final result2 = resultIndex + 1 < listCharacter.length
                              ? listCharacter[resultIndex + 1]
                              : null;
                          return Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CaracterCard(
                                    character: result1,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: result2 != null
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CaracterCard(
                                          character: result2,
                                        ),
                                      )
                                    : Container(),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    error: (_) => const Center(
                      child: Text('Error'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
