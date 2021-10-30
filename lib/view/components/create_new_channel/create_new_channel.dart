import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/controller/group_controller.dart';
import 'package:groupidy/enums/channel_types.dart';
import 'package:groupidy/services/firestore_service.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/button.dart';
import 'package:groupidy/view/components/create_new_channel/channel_icon_input.dart';
import 'package:groupidy/view/components/create_new_channel/channel_name.dart';
import 'package:groupidy/view/components/create_new_channel/choose_channel_type.dart';

class CreateNewChannel extends StatefulWidget {
  const CreateNewChannel({Key? key}) : super(key: key);

  @override
  _CreateNewChannelState createState() => _CreateNewChannelState();
}

class _CreateNewChannelState extends State<CreateNewChannel> {
  GroupController groupController = Get.find();
  ChannelType _type = ChannelType.forum;
  String _name = "";
  String _iconText = "";
  bool _invalidName = false;
  List<bool> _iconTypeSelected = [true, false];

  void handleClose() {}

  void handleCreateChannel() {
    groupController.createChannel(_name, _type);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 600, maxWidth: 400, minWidth: 350),
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
                onPressed: () => Navigator.pop(context),
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
                    onValueChange: (newValue) => setState(() => {_name = newValue}),
                    invalidName: _invalidName,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ChooseChannelType(value: _type, onValueChange: (newValue) => setState(() => {_type = newValue!})),
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
                  onPressed: handleCreateChannel,
                  text: "Create",
                  width: double.infinity,
                  standout: false,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
