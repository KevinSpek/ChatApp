import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../typography.dart';
import 'circle_image.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key? key,
    required this.title,
    this.subTitle,
    this.imagePath,
    this.imageSize = 48.0,
    this.spacing = 12.0,
    this.titleStyle,
    this.subTitleStyle,
    this.useText = false,
    this.text,
  }) : super(key: key);

  final String title;
  final String? subTitle;
  final String? imagePath;
  final double imageSize;
  final double spacing;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final bool useText;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleImage(
          size: imageSize,
          imagePath: imagePath,
          useText: useText,
          text: text,
        ),
        SizedBox(width: spacing),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: titleStyle == null
                    ? kBodyLarge.copyWith(
                        color: kWhite, fontWeight: FontWeight.bold)
                    : titleStyle),
            Visibility(
              child: Text(subTitle == null ? '' : subTitle!,
                  style: subTitleStyle == null
                      ? kCaption.copyWith(color: kWhiteSecondary)
                      : subTitleStyle),
              visible: subTitle != null,
            ),
          ],
        ),
      ],
    );
  }
}
