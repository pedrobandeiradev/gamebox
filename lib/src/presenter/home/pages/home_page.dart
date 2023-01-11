import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gamebox/main.dart';
import 'package:gamebox/src/infra/assets_paths.dart';
import 'package:gamebox/src/domain/entities/game_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  late String dropdownCurrentTerm;
  late final List<String> _sortingOptions;

  //MARK - Remove
  late List<GameItemEntity> games = [
    _game,
    _game,
    _game,
  ];

  final GameItemEntity _game = GameItemEntity(
    id: 452,
    title: 'Call Of Duty: Warzone',
    shortDescription:
        'A standalone free-to-play battle royale and modes accessible via Call of Duty: Modern Warfare.',
    thumbnail: 'https://www.freetogame.com/g/452/thumbnail.jpg',
    publisher: 'Activision Blizzard',
    releaseDate: '25/10/1991',
  );

  @override
  void initState() {
    super.initState();
    _sortingOptions = [
      AppLocalizations.of(context)!.sortingOptionTitle,
      AppLocalizations.of(context)!.sortingOptionReleaseDate,
    ];
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
            controller: _controller,
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
                    _SearchBarHeader(
                      controller: _searchController,
                    ),
                    _SortingOptions(
                      games: [_game],
                      sortingOptions: _sortingOptions,
                      currentValue: dropdownCurrentTerm,
                      callback: (term, sortingList) {
                        setState(() {
                          dropdownCurrentTerm = term;
                          games = sortingList;
                        });
                      },
                    ),
                  ],
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: games.length,
                  itemBuilder: ((context, index) => _GameCard(
                        game: _game,
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
}

class _SearchBarHeader extends StatelessWidget {
  final TextEditingController controller;
  const _SearchBarHeader({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () => print(123),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 15,
                ),
                child: Icon(
                  Icons.search,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  AppLocalizations.of(context)!.searchBarHint,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GameCard extends StatelessWidget {
  final GameItemEntity game;
  const _GameCard({
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          Routes.details,
        ),
        child: Column(
          children: [
            _GameThumbnail(
              game: game,
            ),
            _GameSummaryInfo(
              game: game,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                game.shortDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GameSummaryInfo extends StatelessWidget {
  final GameItemEntity game;

  const _GameSummaryInfo({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              game.title,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              game.publisher,
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Released on ${game.releaseDate}',
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GameThumbnail extends StatelessWidget {
  const _GameThumbnail({
    Key? key,
    required this.game,
  }) : super(key: key);

  final GameItemEntity game;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: CachedNetworkImage(
        imageUrl: game.thumbnail,
        placeholder: (context, url) => Image.asset(
          Assets.defaultImage,
        ),
      ),
    );
  }
}

class _SortingOptions extends StatelessWidget {
  final List<String> sortingOptions;
  final Function(String, List<GameItemEntity>) callback;
  final String currentValue;
  final List<GameItemEntity> games;

  const _SortingOptions({
    required this.games,
    required this.sortingOptions,
    required this.currentValue,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        DropdownButton<String>(
          value: currentValue,
          icon: const Icon(Icons.sort),
          onChanged: (value) {
            sortByTitle();
            sortByReleaseDate();
            callback(value ?? '', games);
          },
          items: sortingOptions.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 2.0,
                ),
                child: Text(value),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  void sortByTitle() {
    games.sort(
        (current, next) => current.releaseDate.compareTo(next.releaseDate));
  }

  void sortByReleaseDate() {
    games.sort((current, next) => current.title.compareTo(next.title));
  }
}
