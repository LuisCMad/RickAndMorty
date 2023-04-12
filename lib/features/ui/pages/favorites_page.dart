import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talenti_test/features/domain/entities/episode.dart';
import 'package:talenti_test/features/ui/bloc/episodeBloc/episode_bloc.dart';
import 'package:talenti_test/features/ui/components/episode_card.dart';
import 'package:talenti_test/features/ui/utils/constants.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Episode> listEpisode = [];
  final _scrollControllerEpisodes = ScrollController();
  int pageCharacter = 1;
  int pageEpisode = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollControllerEpisodes.addListener(() {
      if (_scrollControllerEpisodes.position.pixels ==
          _scrollControllerEpisodes.position.maxScrollExtent) {
        context.read<EpisodeBloc>().add(EpisodeEvent.fetchEpisode(pageEpisode));
        pageEpisode++;
      }
    });
    context.read<EpisodeBloc>().add(EpisodeEvent.fetchEpisode(pageEpisode));
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
              'Episodes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Expanded(
            child: BlocListener<EpisodeBloc, EpisodeState>(
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
                controller: _scrollControllerEpisodes,
                itemCount: listEpisode.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  if(listEpisode.isEmpty){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final Episode episode = listEpisode[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: EpisodeCard(
                      episode: episode,
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
