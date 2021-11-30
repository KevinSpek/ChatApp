import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/controller/channel_controller.dart';
import 'package:groupidy/controller/group_controller.dart';
import 'package:groupidy/controller/user_controller.dart';
import 'package:groupidy/enums/channel_types.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/button.dart';
import 'package:groupidy/view/components/custom_dropdown.dart';
import 'package:groupidy/view/components/custom_text_field.dart';

class ChannelCreate extends StatefulWidget {
  const ChannelCreate({Key? key}) : super(key: key);

  @override
  _ChannelCreateState createState() => _ChannelCreateState();
}

bool isValidName(String name) {
  return name.length >= 3;
}

class _ChannelCreateState extends State<ChannelCreate> {
  var channelController = Get.find<ChannelController>();
  var groupContoller = Get.find<GroupController>();
  var userController = Get.find<UserController>();

  ChannelType _type = ChannelType.forum;
  String _name = "";
  bool _invalidName = false;

  void _handleCreateChannel() {
    if (!isValidName(_name)) {
      setState(() {
        _invalidName = true;
      });
      return;
    }
    else {
      setState(() {
        _invalidName = false;
      });
    }

    channelController.createChannel(
      _name, 
      _type, 
      false, 
      _name.substring(0, 3).toUpperCase(), 
      '',
      userController.user.value!.uid).then((channel) {
        groupContoller.changeMode(Mode.content);
        channelController.handleChannelChange(channel);
        channelController.handleShowChannelInformation();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Create Channel', style: kBodyLarge.copyWith(color: kWhite)),
          CustomTextField(
            onValueChange: (s) {
              setState(() {
                _name = s;
              });
            },
            labelText: 'Name',
            hintText: 'Example: News & Updates',
            padding: EdgeInsets.only(top: 32, bottom: 16),
            errorText: _invalidName ? 'Name must be at least 3 characters long'  : '',
          ),
          CustomDropdown(
            labelText: 'Type',
            items: ChannelType.values.sublist(1).map((type) => channelTypeString[type]!).toList(),
            onValueChange: (v) {
              setState(() {
                _type = channelTypeString.keys.firstWhere((k) => channelTypeString[k] == v);
              });
            },
          ),
          Button(
            onPressed: _handleCreateChannel,
            text: "Create",
            width: 500,
            margin: EdgeInsets.only(top: 32)
          )
        ],
      ),
    );
  }
}
