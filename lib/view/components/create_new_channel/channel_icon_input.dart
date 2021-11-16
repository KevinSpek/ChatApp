import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:groupidy/view/components/button.dart';
import 'package:groupidy/view/components/circle_image.dart';

import '../../../colors.dart';
import '../../../typography.dart';

class ChannelIconInput extends StatefulWidget {
  const ChannelIconInput(
      {Key? key,
      required this.iconTypeSelected,
      required this.onIconTypeSelect,
      required this.iconText,
      required this.channelName,
      required this.onIconTextChange,
      this.imageBytes,
      required this.handleImagePick})
      : super(key: key);

  final List<bool> iconTypeSelected;
  final Function(int) onIconTypeSelect;
  final Function(String) onIconTextChange;
  final VoidCallback handleImagePick;
  final String iconText;
  final String channelName;
  final Uint8List? imageBytes;

  @override
  State<ChannelIconInput> createState() => _ChannelIconInputState();
}

class _ChannelIconInputState extends State<ChannelIconInput> {
  var textController = TextEditingController(text: '');

  @override void initState() {
    textController.text = widget.iconText;
    super.initState();
  }

  void handleChange(String s) {
    
  }

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
                  isSelected: widget.iconTypeSelected,
                  fillColor: kAccentColor,
                  onPressed: widget.onIconTypeSelect,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderColor: kAccentColor,
                  selectedBorderColor: kAccentColor,
                ),
              )
            ]),
            CircleImage(
              size: 64,
              useText: widget.iconTypeSelected[0],
              text: widget.iconText.length == 0
                  ? widget.channelName.length > 3
                      ? widget.channelName.substring(0, 3).toUpperCase()
                      : widget.channelName.toUpperCase()
                  : widget.iconText,
              imagePath: '',
              placeholderPath: '',
              useBytes: widget.imageBytes != null,
              imageBytes: widget.imageBytes,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
            padding: const EdgeInsets.all(16),
            child: widget.iconTypeSelected[0]
                ? TextField(
                    controller: textController,
                    maxLength: 3,
                    onChanged: widget.onIconTextChange,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: widget.channelName.length == 0
                          ? "Icon Text"
                          : widget.channelName.length > 3
                              ? widget.channelName.substring(0, 3).toUpperCase()
                              : widget.channelName.toUpperCase(),
                      counterText: "",
                      hintStyle: kBodyRegular.copyWith(color: kWhiteDisabled),
                    ),
                    style: kBodyRegular.copyWith(color: Colors.white),
                  )
                : Button(
                    onPressed: widget.handleImagePick,
                    text: "Choose icon image",
                    textStyle: kBodyRegular.copyWith(color: kWhite),
                    standout: false,
                    width: 240))
      ],
    );
  }
}
