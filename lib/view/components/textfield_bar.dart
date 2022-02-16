import 'package:flutter/material.dart';
import 'package:chatapp/colors.dart';
import 'package:chatapp/constants.dart';
import 'package:chatapp/typography.dart';

class TextFieldBar extends StatefulWidget {
  TextFieldBar({Key? key, required this.onSend, this.outerPadding = 8.0, this.textStyle, this.hintStyle}) : super(key: key);

  final void Function(String) onSend;
  final double outerPadding;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  @override
  _TextFieldBarState createState() => _TextFieldBarState();
}

class _TextFieldBarState extends State<TextFieldBar> {
  final sendButtonSize = 40.0;
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth,
        constraints: BoxConstraints(maxHeight: 144),
        child: Padding(
          padding: EdgeInsets.all(widget.outerPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxHeight: 108),
                width: constraints.maxWidth - sendButtonSize - widget.outerPadding * 2 - 10,
                decoration: BoxDecoration(
                  color: kSecondaryBubbleLighter,
                  borderRadius: BorderRadius.circular(kRadius),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: textController,
                    style: widget.textStyle == null ? kBodySmall.copyWith(color: kWhite) : widget.textStyle,
                    decoration: InputDecoration.collapsed(
                      hintText: "Type your message here...",
                      border: InputBorder.none,
                      hintStyle: widget.hintStyle == null ? kBodySmall.copyWith(color: Colors.white.withOpacity(0.3)) : widget.hintStyle,
                    ),
                    maxLines: 20,
                    minLines: 1,
                  ),
                ),
              ),
              Spacer(),
              ClipOval(
                child: Material(
                  color: kAccentColor,
                  child: InkWell(
                    onTap: () {
                      widget.onSend(textController.text);
                      textController.text = '';
                    },
                    child: SizedBox(
                      height: sendButtonSize,
                      width: sendButtonSize,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.send_rounded,
                            color: kWhite,
                          )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
