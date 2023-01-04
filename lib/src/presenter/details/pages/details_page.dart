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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _GameThumbnail(),
            _GallerySection(),
          ],
        ),
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
              fontSize: 24.0,
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


            //  Padding(
            //     padding: const EdgeInsets.only(left: 8.0, right: 2.0),
            //     child: Container(
            //       width: 8,
            //       height: 8,
            //       decoration: BoxDecoration(
            //         color: character.alive ? Colors.green : Colors.red,
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //     ),
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.all(2.0),
            //     child: Text(
            //       character.status,
            //       style: const TextStyle(
            //         fontSize: 12.0,
            //       ),
            //     ),
            //   ),