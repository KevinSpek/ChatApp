import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';

import '../../typography.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    this.imagePath,
    this.size = 80,
    this.placeholderPath = "images/user_placeholder.png",
    this.placeholderBackgroundColor = kSecondaryBubble,
    this.useText = false,
    this.text,
  }) : super(key: key);

  final String? imagePath;
  final double size;
  final String placeholderPath;
  final Color placeholderBackgroundColor;
  final bool useText;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: useText
            ? Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: kAccentColor,
                ),
                child: Center(
                    child: Text(
                  text == null ? '' : text!,
                  style: kBodySmall.copyWith(color: kWhite),
                )),
              )
            : CachedNetworkImage(
                imageUrl: imagePath == null ? '' : imagePath!,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Container(
                  color: placeholderBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: placeholderPath == '' ? null : Image(
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
