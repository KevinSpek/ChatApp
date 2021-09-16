import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../typography.dart';
import 'circle_image.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key? key,
    required this.title,
    this.subTitle = '',
    this.imagePath = '',
    this.imageSize = 48.0,
    this.spacing = 12.0,
    this.titleStyle,
    this.subTitleStyle,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String imagePath;
  final double imageSize;
  final double spacing;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleImage(
          size: imageSize,
          imagePath: imagePath,
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
              child: Text(subTitle,
                  style: subTitleStyle == null
                      ? kCaption.copyWith(color: kWhiteSecondary)
                      : subTitleStyle),
              visible: subTitle != '',
            ),
          ],
        ),
      ],
    );
  }
}
