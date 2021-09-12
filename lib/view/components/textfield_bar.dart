import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/constants.dart';
import 'package:groupidy/typography.dart';

class TextFieldBar extends StatefulWidget {
  TextFieldBar({Key? key, required this.onSend}) : super(key: key);
  final void Function(String) onSend;

  @override
  _TextFieldBarState createState() => _TextFieldBarState();
}

class _TextFieldBarState extends State<TextFieldBar> {
  final sendButtonSize = 40.0;
  final outerPadding = 8.0;
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
        constraints: BoxConstraints(minHeight: 64, maxHeight: 144),
        child: Padding(
          padding: EdgeInsets.all(outerPadding),
          child: Row(
            children: [
              Container(
                constraints: BoxConstraints(maxHeight: 108),
                width: constraints.maxWidth - sendButtonSize - outerPadding * 2 - 10,
                decoration: BoxDecoration(
                  color: kSecondaryBubble,
                  borderRadius: BorderRadius.circular(kRadius),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: textController,
                    style: kBodySmall.copyWith(color: kWhite),
                    decoration: InputDecoration.collapsed(
                      hintText: "Type your message",
                      border: InputBorder.none,
                      hintStyle: kBodySmall.copyWith(color: Colors.white.withOpacity(0.3)),
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
                    onTap: () => {widget.onSend(textController.text)},
                    child: SizedBox(
                      height: sendButtonSize,
                      width: sendButtonSize,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('images/send.png'),
                      ),
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
