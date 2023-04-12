import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talenti_test/features/domain/entities/character.dart';
import 'package:talenti_test/features/domain/entities/episode.dart';
import 'package:talenti_test/features/ui/bloc/characterBloc/character_bloc.dart';
import 'package:talenti_test/features/ui/bloc/episodeBloc/episode_bloc.dart';
import 'package:talenti_test/features/ui/components/course_card.dart';
import 'package:talenti_test/features/ui/components/secondary_course_card.dart';
import 'package:talenti_test/features/ui/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollControllerCharacters = ScrollController();
  final _scrollControllerEpisodes = ScrollController();
  List<Episode> listEpisode = [];
  List<Character> listCharacter = [];
  int pageEpisode = 1;
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

    _scrollControllerEpisodes.addListener(() {
      if (_scrollControllerEpisodes.position.pixels ==
          _scrollControllerEpisodes.position.maxScrollExtent) {
        context.read<EpisodeBloc>().add(EpisodeEvent.fetchEpisode(pageEpisode));
        pageEpisode++;
      }
    });
    context
        .read<CharacterBloc>()
        .add(CharacterEvent.fetchCharacter(pageCharacter));
    context.read<EpisodeBloc>().add(EpisodeEvent.fetchEpisode(pageEpisode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2.withOpacity(0.9),
      body: SingleChildScrollView(
        controller: _scrollControllerEpisodes,
        child: Column(
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
            SizedBox(
              height: 280,
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
                  scrollDirection: Axis.horizontal,
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
                      padding: const EdgeInsets.all(8.0),
                      child: CaracterCard(
                        character: character,
                      ),
                    );
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Episodes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            BlocListener<EpisodeBloc, EpisodeState>(
              listener: (context, state) {
                state.maybeMap(
                  orElse: () {},
                  loaded: (state) {
                    setState(() {
                      listEpisode.addAll(state.episode);
                    });
                  },
                );
              },
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listEpisode.length,
                itemBuilder: (BuildContext context, int index) {
                  if (listEpisode.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final Episode episode = listEpisode[index];
                  return EpisodeCard(
                    episode: episode,
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
