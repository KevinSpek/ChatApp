import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/controller/channel_controller.dart';
import 'package:chatapp/view/components/button.dart';
import 'package:chatapp/view/components/create_new_channel/channel_icon_input.dart';
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
  PlatformFile? _file;

  @override
  void initState() {
    setState(() {
      _iconText = channelController.getIconText();
    });
    super.initState();
  }

  void handleImagePick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() {
        _file = result.files.first;
      });
    }
  }

  void handleUpdate() {
    channelController.updateChannelImage(_iconTypeSelected[1], _iconText, _file);
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
                  handleImagePick: handleImagePick,
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
                  imageBytes: _file != null ? _file!.bytes : null,
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
