import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/button.dart';
import 'package:groupidy/view/components/new_channel/channel_icon.dart';
import 'package:groupidy/view/components/new_channel/channel_name.dart';
import 'package:groupidy/view/components/new_channel/channel_type.dart';

class NewChannel extends StatefulWidget {
  const NewChannel({Key? key}) : super(key: key);

  @override
  _NewChannelState createState() => _NewChannelState();
}

class _NewChannelState extends State<NewChannel> {
  String _type = "Chat";
  String _name = "";
  String _iconText = "";
  bool _invalidName = false;
  List<bool> _iconTypeSelected = [true, false];

  void handleClose() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(maxHeight: 600, maxWidth: 400),
        color: kSecondaryBackground,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: kWhite,
                    size: 24,
                  ),
                  onPressed: null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      "New Channel",
                      style: kBodyLarge.copyWith(color: kWhite),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: ChannelName(
                      onValueChange: (newValue) =>
                          setState(() => {_name = newValue}),
                      invalidName: _invalidName,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ChannelType(
                        value: _type,
                        onValueChange: (newValue) =>
                            setState(() => {_type = newValue!})),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ChannelIcon(
                        iconTypeSelected: _iconTypeSelected,
                        onIconTypeSelect: (index) => {
                          setState(() {
                            _iconTypeSelected[index] = true;
                            _iconTypeSelected[index == 1 ? 0 : 1] = false;
                          },)
                        },
                        channelName: _name,
                        iconText: _iconText,
                        onIconTextChange: (text) => {
                          setState(() {
                            _iconText = text;
                          })
                        },
                      )),
                  Spacer(),
                  Button(
                    onPressed: null,
                    text: "Create",
                    width: double.infinity,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}