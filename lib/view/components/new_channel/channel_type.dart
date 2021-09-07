import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';

import '../../../typography.dart';

class ChannelType extends StatelessWidget {
  const ChannelType({Key? key, required this.value, required this.onValueChange }) : super(key: key);

  final String value;
  final Function(String?) onValueChange;

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
            onChanged: onValueChange,
            dropdownColor: kPrimaryBackground,
            items: ['Chat', 'Forum', 'Group chat'].map((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
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
