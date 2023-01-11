import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamebox/src/domain/usecases/game_details/repository/game_details_repository.dart';
import 'package:gamebox/src/presenter/home/bloc/game_list_index.dart';
import 'src/domain/usecases/games_list/repository/games_list_repository.dart';
import 'src/presenter/home/pages/home_index.dart';
import 'src/presenter/details/pages/details_index.dart';
import 'src/presenter/details/bloc/game_details_index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';
export 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const GameBox());
}

class GameBox extends StatelessWidget {
  const GameBox({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GameListBloc>(
          create: (BuildContext context) =>
              GameListBloc(repository: GamesList()),
        ),
        BlocProvider<GameDetailsBloc>(
          create: (BuildContext context) =>
              GameDetailsBloc(repository: GameDetails()),
        ),
      ],
      child: MaterialApp(
        title: 'Gamebox - The Free-To-Play Games Database',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: Routes.builder,
        initialRoute: Routes.home,
      ),
    );
  }
}

class Routes {
  static Map<String, WidgetBuilder> builder = {
    Routes.home: (context) => const HomePage(),
    Routes.details: (context) => const DetailsPage(),
  };

  static const String home = '/home', details = '/details';
}
