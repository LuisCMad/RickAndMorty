import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talenti_test/features/domain/entities/character.dart';
import 'package:talenti_test/features/ui/bloc/characterBloc/character_bloc.dart';
import 'package:talenti_test/features/ui/components/course_card.dart';
import 'package:talenti_test/features/ui/utils/constants.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  List<Character> listCharacter = [];
  final _scrollControllerCharacters = ScrollController();
  int pageCharacter = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollControllerCharacters.addListener(() {
      if (_scrollControllerCharacters.position.pixels ==
          _scrollControllerCharacters.position.maxScrollExtent) {
        context
            .read<CharacterBloc>()
            .add(CharacterEvent.fetchCharacter(pageCharacter));
        pageCharacter++;
      }
    });
    context
        .read<CharacterBloc>()
        .add(CharacterEvent.fetchCharacter(pageCharacter));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2.withOpacity(0.9),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Characters',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Expanded(
            child: BlocListener<CharacterBloc, CharacterState>(
              listener: (context, state) {
                state.maybeMap(
                  orElse: () {},
                  loaded: (state) {
                    setState(() {
                      listCharacter.addAll(state.listCharacter);
                    });
                  },
                );
              },
              child: ListView.builder(
                controller: _scrollControllerCharacters,
                itemCount: listCharacter.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  if (listCharacter.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
                  final Character character = listCharacter[index];
                  return Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: CaracterCard(
                      character: character,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
