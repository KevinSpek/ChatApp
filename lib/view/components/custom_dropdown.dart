import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../typography.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown(
      {Key? key,
      this.items = const [],
      this.labelText = '',
      this.padding = const EdgeInsets.all(0),
      required this.onValueChange})
      : super(key: key);

  final List<String> items;
  final String labelText;
  final EdgeInsets padding;
  final Function(String) onValueChange;

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      constraints: BoxConstraints(maxWidth: 500),
      child: DropdownButtonFormField(
          value: _value,
          icon: const Icon(
            Icons.unfold_more_rounded,
          ),
          iconSize: 24,
          style: kBodyRegular.copyWith(color: kWhite),
          dropdownColor: kPrimaryBackground,
          items: widget.items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: kBodyRegular.copyWith(color: kWhite),
              ),
            );
          }).toList(),
          onChanged: (String? newVal) {
            setState(() {
              _value = newVal!;
            });
            widget.onValueChange(newVal!);
          },
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: kBodyRegular.copyWith(color: kWhiteSecondary),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kWhiteDisabled, width: 0.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kWhiteSecondary, width: 0.0),
            ),
          )),
    );
  }
}
