import 'package:flutter/material.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/view/components/button.dart';
import 'package:groupidy/view/components/new_channel/channel_icon_input.dart';

import '../../colors.dart';
import '../../typography.dart';

class ChannelImageChange extends StatefulWidget {
  const ChannelImageChange({Key? key, required this.channel}) : super(key: key);

  final Channel channel;

  @override
  _ChannelImageChangeState createState() => _ChannelImageChangeState();
}

class _ChannelImageChangeState extends State<ChannelImageChange> {
  String _iconText = "";
  bool _invalidName = false;
  List<bool> _iconTypeSelected = [true, false];

  void handleClose() {}

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        constraints:
            BoxConstraints(maxHeight: 300, maxWidth: 400, minWidth: 350),
        color: kSecondaryBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ChannelIconInput(
                  iconTypeSelected: _iconTypeSelected,
                  onIconTypeSelect: (index) => {
                    setState(
                      () {
                        _iconTypeSelected[index] = true;
                        _iconTypeSelected[index == 1 ? 0 : 1] = false;
                      },
                    )
                  },
                  channelName: widget.channel.name,
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
              text: "Update",
              width: double.infinity,
            )
          ],
        ));
  }
}
