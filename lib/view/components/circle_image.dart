import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';

import '../../typography.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    this.imagePath,
    this.size = 80,
    this.placeholderPath,
    this.placeholderBackgroundColor = kSecondaryBubble,
    this.useText = false,
    this.text,
    this.padding,
    this.onClick,
    this.useBytes = false,
    this.imageBytes,
  }) : super(key: key);

  final String? imagePath;
  final double size;
  final String? placeholderPath;
  final Color placeholderBackgroundColor;
  final bool useText;
  final String? text;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onClick;
  final bool useBytes;
  final Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding == null ? EdgeInsets.zero : padding!,
      child: InkWell(
        onTap: onClick,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(size / 2),
            child: useBytes
                ? Image.memory(
                    imageBytes!,
                    width: size,
                    height: size,
                    fit: BoxFit.cover,
                  )
                : useText
                    ? Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                          color: kAccentColor,
                        ),
                        child: Center(
                            child: Text(
                          text == null ? '' : text!,
                          style: kBodySmall.copyWith(
                              color: kWhite, fontSize: size * 0.3),
                        )),
                      )
                    : CachedNetworkImage(
                        imageUrl: imagePath == null ? '' : imagePath!,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Container(
                          color: placeholderBackgroundColor,
                          child: Padding(
                            padding: EdgeInsets.all(size / 4.0),
                            child: Image(
                              image: AssetImage(placeholderPath ??
                                  "images/user_placeholder.png"),
                            ),
                          ),
                        ),
                        width: size,
                        height: size,
                        fit: BoxFit.cover,
                      )),
      ),
    );
  }
}
