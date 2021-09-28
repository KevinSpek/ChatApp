import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/constants.dart';
import 'package:groupidy/typography.dart';

class SettingsToggle extends StatefulWidget {
  const SettingsToggle({Key? key, required this.title, required this.onChange}) : super(key: key);
  final Function(bool) onChange;
  final String title;

  @override
  _SettingsToggleState createState() => _SettingsToggleState();
}

class _SettingsToggleState extends State<SettingsToggle> {
  bool toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding, vertical: kPadding / 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: kBodyRegular.copyWith(color: kWhite, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Switch.adaptive(
                value: toggleValue,
                onChanged: (newValue) {
                  setState(() {
                    toggleValue = newValue;
                  });
                  widget.onChange(newValue);
                })
          ],
        ),
      ),
    );
  }
}
