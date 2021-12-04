import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/constants.dart';
import 'package:groupidy/typography.dart';

class SettingsToggle extends StatefulWidget {
  const SettingsToggle({Key? key, required this.title, required this.onChange})
      : super(key: key);
  final Function(bool)? onChange;
  final String title;

  @override
  _SettingsToggleState createState() => _SettingsToggleState();
}

class _SettingsToggleState extends State<SettingsToggle> {
  bool toggleValue = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kPadding, vertical: kPadding / 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: kBodyRegular.copyWith(
                  color: kWhite, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IgnorePointer(
              ignoring: widget.onChange == null ? true : false,
              child: Opacity(
                opacity: widget.onChange == null ? 0.5 : 1.0,
                child: Switch.adaptive(
                    value: toggleValue,
                    onChanged: widget.onChange == null
                        ? (newValue) {}
                        : (newValue) {
                            setState(() {
                              toggleValue = newValue;
                            });
                            widget.onChange!(newValue);
                          }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
