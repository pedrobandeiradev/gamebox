import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gamebox/src/infra/assets_paths.dart';

class Thumbnail extends StatelessWidget {
  final String thumbnailUrl;

  const Thumbnail({
    Key? key,
    required this.thumbnailUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: CachedNetworkImage(
        imageUrl: thumbnailUrl,
        placeholder: (context, url) => Image.asset(
          Assets.defaultImage,
        ),
      ),
    );
  }
}
