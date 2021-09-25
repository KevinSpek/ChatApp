import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/model/channels/channel_type.dart';

import '../../../typography.dart';

class ChooseChannelType extends StatelessWidget {
  const ChooseChannelType({Key? key, required this.value, required this.onValueChange}) : super(key: key);

  final ChannelType value;
  final Function(ChannelType?) onValueChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Channel type",
          style: kBodyRegular.copyWith(color: kWhiteSecondary),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DropdownButton(
            value: value,
            icon: const Icon(
              Icons.unfold_more_rounded,
            ),
            iconSize: 24,
            elevation: 16,
            style: kBodyRegular.copyWith(color: kWhite),
            underline: Container(
              height: 2,
              color: kAccentColor,
            ),
            onChanged: (ChannelType? val) => onValueChange(val),
            dropdownColor: kPrimaryBackground,
            items: ChannelType.values.map((ChannelType channelType) {
              return DropdownMenuItem(
                value: channelType,
                child: Text(
                  channelTypeString[channelType]!,
                  style: kBodyRegular.copyWith(color: kWhite),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
