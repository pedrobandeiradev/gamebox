import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gamebox/src/infra/assets_paths.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          enableFeedback: false,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _GameThumbnail(),
            _GameMainInfo(
              information: {
                'Genre': 'Shooter',
                'Released on': '25/10/1991',
                'Publisher': 'Activision Blizzard',
                'Developed by': 'Infinity Ward',
              },
            ),
            _GameDetailsInfo(),
            _GallerySection(),
          ],
        ),
      ),
    );
  }
}

class _GameMainInfo extends StatelessWidget {
  final Map<String, String> information;

  const _GameMainInfo({
    required this.information,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 24.0,
            ),
            child: Text(
              'Call of Duty Warzone',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              mainAxisExtent: 60,
              crossAxisSpacing: 10,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => _GameInfoItem(
              title: information.keys.elementAt(index),
              description: information.values.elementAt(index),
            ),
          ),
        ],
      ),
    );
  }
}

class _GameInfoItem extends StatelessWidget {
  final String title;
  final String description;

  const _GameInfoItem({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey.shade500,
            ),
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _GameDetailsInfo extends StatelessWidget {
  const _GameDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 12.0,
            ),
            child: Text(
              'About Call of Duty: Warzone',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'Call of Duty: Warzone is both a standalone free-to-play battle royale and modes accessible via Call of Duty: Modern Warfare. Warzone features two modes — the general 150-player battle royle, and “Plunder”. The latter mode is described as a “race to deposit the most Cash”. In both modes players can both earn and loot cash to be used when purchasing in-match equipment, field upgrades, and more. Both cash and XP are earned in a variety of ways, including completing contracts.\r\n\r\nAn interesting feature of the game is one that allows players who have been killed in a match to rejoin it by winning a 1v1 match against other felled players in the Gulag.\r\n\r\nOf course, being a battle royale, the game does offer a battle pass. The pass offers players new weapons, playable characters, Call of Duty points, blueprints, and more. Players can also earn plenty of new items by completing objectives offered with the pass.',
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class _GameThumbnail extends StatelessWidget {
  const _GameThumbnail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'https://www.freetogame.com/g/452/thumbnail.jpg',
      placeholder: (context, url) => Image.asset(
        Assets.defaultImage,
      ),
    );
  }
}

class _GallerySection extends StatelessWidget {
  const _GallerySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Gallery',
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CarouselSlider.builder(
          options: CarouselOptions(
            enableInfiniteScroll: false,
          ),
          itemCount: 4,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CachedNetworkImage(
              imageUrl: 'https://www.freetogame.com/g/452/thumbnail.jpg',
              placeholder: (context, url) => Image.asset(
                Assets.defaultImage,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
