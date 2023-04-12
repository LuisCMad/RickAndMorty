import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talenti_test/features/ui/bloc/characterBloc/character_bloc.dart';
import 'package:talenti_test/features/ui/bloc/episodeBloc/episode_bloc.dart';
import 'package:talenti_test/features/ui/bloc/searchCharacter/search_character_bloc.dart';
import 'package:talenti_test/features/ui/pages/login_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<CharacterBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<EpisodeBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<SearchCharacterBloc>(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFEEF1F8),
            primarySwatch: Colors.blue,
            fontFamily: "Intel",
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              errorStyle: TextStyle(height: 0),
              border: defaultInputBorder,
              enabledBorder: defaultInputBorder,
              focusedBorder: defaultInputBorder,
              errorBorder: defaultInputBorder,
            ),
          ),
          home: const LoginPage(),
        ));
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);
