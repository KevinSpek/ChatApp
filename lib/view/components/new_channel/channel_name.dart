import 'package:flutter/material.dart';

import '../../../colors.dart';
import '../../../typography.dart';

class ChannelName extends StatelessWidget {
  const ChannelName({Key? key, required this.onValueChange, this.invalidName = false}) : super(key: key);

  final Function(String) onValueChange;
  final bool invalidName;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Channel name",
        style: kBodyRegular.copyWith(color: kWhiteSecondary),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          maxLength: 40,
          onChanged: onValueChange,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            hintText: "Example: News & Updates",
            counterText: "",
            hintStyle: kBodyRegular.copyWith(color: kWhiteDisabled),
          ),
          style: kBodyRegular.copyWith(color: Colors.white),
        ),
      ),
      Visibility(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Text(
            "* Name must contain atleast 3 characters",
            style: kBodySmall.copyWith(color: kError),
          ),
        ),
        visible: invalidName,
      ),
    ]);
  }
}
