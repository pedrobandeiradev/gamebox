import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamebox/main.dart';
import 'package:gamebox/src/presenter/home/bloc/game_list_index.dart';
import 'package:gamebox/src/presenter/home/widgets/home_widgets_index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  late String dropdownCurrentTerm;
  late final List<String> _sortingOptions;
  GameListBloc get _bloc => BlocProvider.of<GameListBloc>(context);

  @override
  void initState() {
    super.initState();
    _sortingOptions = ['Title', 'Release date'];
    dropdownCurrentTerm = _sortingOptions.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 24.0,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Text(
                            AppLocalizations.of(context)!.homeTitle,
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SearchBar(
                      controller: _searchController,
                    ),
                    SortingOptions(
                      sortingOptions: _sortingOptions,
                      currentValue: dropdownCurrentTerm,
                      callback: (term) {
                        term == AppLocalizations.of(context)!.sortingOptionTitle
                            ? sortByTitle()
                            : sortByReleaseDate();
                        setState(() {
                          dropdownCurrentTerm = term;
                        });
                      },
                    ),
                  ],
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _bloc.games.length,
                  itemBuilder: ((context, index) => ContentCard(
                        game: _bloc.games[index],
                      )),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sortByTitle() {
    _bloc.games.sort(
        (next, current) => current.releaseDate.compareTo(next.releaseDate));
  }

  void sortByReleaseDate() {
    _bloc.games.sort((next, current) => current.title.compareTo(next.title));
  }
}
