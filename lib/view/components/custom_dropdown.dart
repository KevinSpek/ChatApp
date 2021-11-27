import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../typography.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({Key? key, this.items = const []}) : super(key: key);

  final List<String> items;

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  var _value = 'News';

  @override
  void initState() {
    setState(() {
      _value = widget.items[0];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _value,
      hint: Text("hint???"),
      icon: const Icon(
        Icons.unfold_more_rounded,
      ),
      iconSize: 24,
      style: kBodyRegular.copyWith(color: kWhite),
      dropdownColor: kPrimaryBackground,
      items: widget.items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: kBodyRegular.copyWith(color: kWhite),),
        );
      }).toList(),
      onChanged: (String? newVal) {
        setState(() {
          _value = newVal!;
        });
      },
    );
  }
}
