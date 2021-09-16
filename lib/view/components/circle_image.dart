import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';

class CircleImage extends StatelessWidget {
  const CircleImage(
      {Key? key,
      this.imagePath = "",
      this.size = 80,
      this.placeholderPath = "images/user_placeholder.png",
      this.placeholderBackgroundColor = kSecondaryBubble,})
      : super(key: key);

  final String imagePath;
  final double size;
  final String placeholderPath;
  final Color placeholderBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: CachedNetworkImage(
          imageUrl: imagePath,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Container(
            color: placeholderBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(placeholderPath),
              ),
            ),
          ),
          width: size,
          height: size,
          fit: BoxFit.cover,
        ));
  }
}
