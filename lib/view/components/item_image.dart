import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/constants.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({
    Key? key,
    this.image,
  }) : super(key: key);
  final String? image;
  final double size = 60;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kWhite.withOpacity(0.5),
            ),
          ),
          LayoutBuilder(builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth * 0.7,
              height: constraints.maxHeight * 0.7,
              child: Image.asset(image == null ? 'images/user_placeholder.png' : image!),
            );
          }) // TODO: change to group image!
        ],
      ),
    );
  }
}
