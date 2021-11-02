import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/controller/channel_controller.dart';
import 'package:groupidy/view/components/button.dart';
import 'package:groupidy/view/components/create_new_channel/channel_icon_input.dart';
import '../../colors.dart';

class ChannelImageChange extends StatefulWidget {
  const ChannelImageChange({Key? key}) : super(key: key);

  @override
  _ChannelImageChangeState createState() => _ChannelImageChangeState();
}

class _ChannelImageChangeState extends State<ChannelImageChange> {
  var channelController = Get.find<ChannelController>();

  String _iconText = "";
  List<bool> _iconTypeSelected = [true, false];

  @override 
  void initState() {
    setState(() {
      _iconText = channelController.getIconText();
    });
    super.initState();
  }

  void handleUpdate() {
    channelController.updateChannelImage(_iconTypeSelected[1], _iconText, '');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        constraints: BoxConstraints(maxHeight: 300, maxWidth: 400, minWidth: 350),
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
                  channelName: channelController.getName(),
                  iconText: _iconText,
                  onIconTextChange: (text) => {
                    setState(() {
                      _iconText = text;
                    })
                  },
                )),
            Spacer(),
            Button(
              onPressed: handleUpdate,
              text: "Update",
              width: double.infinity,
            )
          ],
        ));
  }
}
