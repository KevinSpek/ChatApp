import 'package:flutter/material.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/view/components/create_new_channel/channel_icon_input.dart';

import '../../../colors.dart';
import '../../../typography.dart';
import '../button.dart';

class EditChannel extends StatefulWidget {
  const EditChannel({Key? key, required this.channel}) : super(key: key);

  final Channel channel;

  @override
  _EditChannelState createState() => _EditChannelState();
}

class _EditChannelState extends State<EditChannel> {
  String _iconText = "";
  bool _invalidName = false;
  List<bool> _iconTypeSelected = [true, false];

  void handleClose() {}

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        constraints: BoxConstraints(maxHeight: 600, maxWidth: 400, minWidth: 350),
        color: kSecondaryBackground,
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
                    "Edit Channel",
                    style: kBodyLarge.copyWith(color: kWhite),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      SizedBox(
                        child: Text(
                          'Name',
                          style: kBodySmall.copyWith(color: kWhite),
                        ),
                        width: 80,
                      ),
                      Text(
                        widget.channel.name,
                        style: kBodySmall.copyWith(color: kWhiteSecondary),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      SizedBox(
                        child: Text(
                          'Type',
                          style: kBodySmall.copyWith(color: kWhite),
                        ),
                        width: 80,
                      ),
                      Text(
                        widget.channel.type.toString(),
                        style: kBodySmall.copyWith(color: kWhiteSecondary),
                      )
                    ],
                  ),
                ),
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
            )
          ],
        ));
  }
}
