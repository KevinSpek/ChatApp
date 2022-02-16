import 'package:flutter/material.dart';
import 'package:chatapp/colors.dart';
import 'package:chatapp/typography.dart';

class CustomEditableText extends StatefulWidget {
  const CustomEditableText({Key? key, this.initialText = '', this.hint = '', this.textStyle, this.hintStyle, this.maxLines, this.maxLength, this.onTextChange, this.editable = true}) : super(key: key);

  final String? initialText;
  final String hint;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final int? maxLines;
  final int? maxLength;
  final Function(String)? onTextChange;
  final bool editable;

  @override
  _CustomEditableTextState createState() => _CustomEditableTextState();
}

class _CustomEditableTextState extends State<CustomEditableText> {
  final textEditingController = TextEditingController();
  String _text = '';
  bool _isEditMode = false;

  @override
  void initState() {
    _text = widget.initialText ?? '';
    _isEditMode = false;
    textEditingController.text = widget.initialText ?? '';
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void handleStartEditMode() {
    setState(() {
      _isEditMode = true;
    });
  }

  void handleAcceptEdit() {
    setState(() {
      _isEditMode = false;
      _text = textEditingController.text;
    });
    if (widget.onTextChange != null) widget.onTextChange!(textEditingController.text);
  }

  void handleRejectEdit() {
    setState(() {
      _isEditMode = false;
      textEditingController.text = _text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.editable
            ? _isEditMode
                ? Row(
                    children: [
                      IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: handleAcceptEdit,
                          icon: Icon(
                            Icons.check_rounded,
                            color: kWhite,
                            size: 24,
                          )),
                      IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: handleRejectEdit,
                          icon: Icon(
                            Icons.close_rounded,
                            color: kWhite,
                            size: 24,
                          )),
                    ],
                  )
                : IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: handleStartEditMode,
                    icon: Icon(
                      Icons.edit_rounded,
                      color: kWhite,
                      size: 24,
                    ))
            : SizedBox.shrink(),
        Container(
          child: TextField(
            readOnly: !_isEditMode,
            controller: textEditingController,
            maxLength: widget.maxLength ?? 200,
            keyboardType: TextInputType.multiline,
            maxLines: widget.maxLines ?? null,
            decoration: InputDecoration(hintText: widget.hint, hintStyle: widget.hintStyle ?? kBodyRegular.copyWith(color: kWhiteSecondary), border: InputBorder.none, isDense: true, counterText: '', contentPadding: EdgeInsets.only(left: widget.editable ? 8 : 0)),
            style: widget.textStyle ?? kBodyRegular.copyWith(color: kWhite),
          ),
          width: 300,
          constraints: BoxConstraints(minHeight: 24, maxHeight: 100),
        ),
      ],
    );
  }
}
