import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gamebox/main.dart';
import 'package:gamebox/src/infra/assets_paths.dart';
import 'package:gamebox/src/usecases/games_list/game_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final GameItemEntity _character = GameItemEntity(
    id: 452,
    title: 'Call Of Duty: Warzone',
    shortDescription:
        'A standalone free-to-play battle royale and modes accessible via Call of Duty: Modern Warfare.',
    thumbnail: 'https://www.freetogame.com/g/452/thumbnail.jpg',
    publisher: 'Activision Blizzard',
    releaseDate: '25/10/1991',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 24.0,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                controller: _controller,
                itemCount: 20,
                itemBuilder: ((context, index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        const _GamesListHeader(),
                        _SearchBarHeader(controller: _searchController),
                      ],
                    );
                  }
                  return _GameCard(
                    game: _character,
                  );
                }),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
              ),
            ),
          ],
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
                  'Search by title, description or publisher',
                  style: TextStyle(
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

class _GamesListHeader extends StatelessWidget {
  final String title = "Games";
  const _GamesListHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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
            _GameThumbnail(character: game),
            _NameAndStatus(game: game),
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

class _NameAndStatus extends StatelessWidget {
  const _NameAndStatus({
    Key? key,
    required this.game,
  }) : super(key: key);

  final GameItemEntity game;

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
    required this.character,
  }) : super(key: key);

  final GameItemEntity character;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: CachedNetworkImage(
        imageUrl: character.thumbnail,
        placeholder: (context, url) => Image.asset(
          Assets.defaultImage,
        ),
      ),
    );
  }
}
