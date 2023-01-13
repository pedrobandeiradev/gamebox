import 'package:flutter/material.dart';
import 'package:gamebox/main.dart';
import 'package:gamebox/src/domain/entities/game_item.dart';
import 'package:gamebox/src/presenter/home/widgets/thumbnail.dart';

class ContentCard extends StatelessWidget {
  final GameItemEntity game;
  const ContentCard({
    super.key,
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
            Thumbnail(
              thumbnailUrl: game.thumbnail,
            ),
            _SummaryInfo(
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

class _SummaryInfo extends StatelessWidget {
  final GameItemEntity game;

  const _SummaryInfo({
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
              AppLocalizations.of(context)!
                  .releasedOnDescription(game.releaseDate),
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
