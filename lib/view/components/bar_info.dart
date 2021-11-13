import 'package:flutter/material.dart';

import '../../colors.dart';
import 'item_info.dart';

class BarInfo extends StatelessWidget {
  const BarInfo({
    Key? key,
    this.color = kAccentColor,
    this.itemInfoClick,
    required this.title,
    this.subTitle,
    this.imagePath,
    this.leftWidget,
    this.rightWidget,
    this.useIconText = false,
    this.iconText,
    this.placeHolderPath,
  }) : super(key: key);

  final Color color;
  final Function()? itemInfoClick;
  final String title;
  final String? subTitle;
  final String? imagePath;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final bool useIconText;
  final String? iconText;
  final String? placeHolderPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 64,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leftWidget == null ? SizedBox.shrink() : leftWidget!,
            InkWell(
              onTap: itemInfoClick,
              child: Row(
                children: [
                  ItemInfo(
                    title: title,
                    imagePath: imagePath,
                    subTitle: subTitle,
                    useText: useIconText,
                    text: iconText,
                    placeHolderPath: placeHolderPath,
                  ),
                ],
              ),
            ),
            Spacer(),
            rightWidget == null ? SizedBox.shrink() : rightWidget!,
          ],
        ),
      ),
    );
  }
}
