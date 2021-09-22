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
    this.padding,
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
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
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
              SizedBox(
                height: 3,
              ),
              Visibility(
                child: Text(subTitle == null ? '' : subTitle!,
                    style: subTitleStyle == null
                        ? kBodySmall.copyWith(color: kWhiteSecondary)
                        : subTitleStyle),
                visible: subTitle != null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
