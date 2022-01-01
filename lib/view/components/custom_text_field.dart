import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../typography.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      required this.onValueChange,
      this.initialText = '',
      this.hintText = '',
      this.labelText = '',
      this.errorText = '',
      this.padding = const EdgeInsets.all(0)})
      : super(key: key);

  final Function(String) onValueChange;
  final String initialText;
  final String hintText;
  final String labelText;
  final String errorText;
  final EdgeInsets padding;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.initialText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      constraints: BoxConstraints(maxWidth: 500),
      child: TextField(
        maxLength: 40,
        textAlign: TextAlign.start,
        onChanged: widget.onValueChange,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: kBodyRegular.copyWith(color: kWhiteDisabled),
          labelText: widget.labelText,
          labelStyle: kBodyRegular.copyWith(color: kWhiteSecondary),
          helperText: widget.errorText,
          helperStyle: kCaption.copyWith(color: kError),
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kWhiteDisabled, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kWhiteSecondary, width: 0.0),
          ),
        ),
        style: kBodyRegular.copyWith(color: Colors.white),
      ),
    );
  }
}
