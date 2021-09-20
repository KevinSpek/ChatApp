import 'package:flutter/material.dart';
import 'package:groupidy/constants.dart';
import 'package:groupidy/view/components/button.dart';
import 'package:groupidy/view/components/circle_image.dart';

import '../../../colors.dart';
import '../../../typography.dart';

class ChannelIconInput extends StatelessWidget {
  const ChannelIconInput(
      {Key? key,
      required this.iconTypeSelected,
      required this.onIconTypeSelect,
      required this.iconText,
      required this.channelName,
      required this.onIconTextChange})
      : super(key: key);

  final List<bool> iconTypeSelected;
  final Function(int) onIconTypeSelect;
  final Function(String) onIconTextChange;
  final String iconText;
  final String channelName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Channel icon",
                style: kBodyRegular.copyWith(color: kWhiteSecondary),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 16, left: 16),
                child: ToggleButtons(
                  constraints: BoxConstraints(minHeight: 40),
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        "Text",
                        textAlign: TextAlign.center,
                        style: kBodyRegular.copyWith(color: kWhite),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        "Image",
                        textAlign: TextAlign.center,
                        style: kBodyRegular.copyWith(color: kWhite),
                      ),
                    ),
                  ],
                  isSelected: iconTypeSelected,
                  fillColor: kAccentColor,
                  onPressed: onIconTypeSelect,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderColor: kAccentColor,
                  selectedBorderColor: kAccentColor,
                ),
              )
            ]),
            CircleImage(
              size: 64,
              useText: iconTypeSelected[0],
              text: iconText.length == 0
                  ? channelName.length > 3
                      ? channelName.substring(0, 3).toUpperCase()
                      : channelName.toUpperCase()
                  : iconText,
              imagePath: '',
              placeholderPath: '',
            )
          ],
        ),
        Padding(
            padding: const EdgeInsets.all(16),
            child: iconTypeSelected[0]
                ? TextField(
                    maxLength: 3,
                    onChanged: onIconTextChange,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: channelName.length == 0
                          ? "Icon Text"
                          : channelName.length > 3
                              ? channelName.substring(0, 3).toUpperCase()
                              : channelName.toUpperCase(),
                      counterText: "",
                      hintStyle: kBodyRegular.copyWith(color: kWhiteDisabled),
                    ),
                    style: kBodyRegular.copyWith(color: Colors.white),
                  )
                : Button(
                    onPressed: null,
                    text: "Choose icon image",
                    textStyle: kBodyRegular.copyWith(color: kWhite),
                    width: 240))
      ],
    );
  }
}
