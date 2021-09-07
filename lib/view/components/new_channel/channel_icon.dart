import 'package:flutter/material.dart';
import 'package:groupidy/view/components/button.dart';

import '../../../colors.dart';
import '../../../typography.dart';

class ChannelIcon extends StatelessWidget {
  const ChannelIcon(
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
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: kAccentColor,
              ),
              child: Center(
                  child: Text(
                iconText.length == 0
                    ? channelName.length > 5
                        ? channelName.substring(0, 5)
                        : channelName
                    : iconText,
                style: kBodySmall.copyWith(color: kWhite),
              )),
            )
          ],
        ),
        Padding(
            padding: const EdgeInsets.all(16),
            child: iconTypeSelected[0]
                ? TextField(
                    maxLength: 5,
                    onChanged: onIconTextChange,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: channelName.length == 0
                          ? "Icon Text"
                          : channelName.length > 5
                              ? channelName.substring(0, 5)
                              : channelName,
                      counterText: "",
                      hintStyle: kBodyRegular.copyWith(color: kWhiteDisabled),
                    ),
                    style: kBodyRegular.copyWith(color: Colors.white),
                  )
                : Button(
                    onPressed: null,
                    text: "Choose icon image",
                    width: double.infinity))
      ],
    );
  }
}
