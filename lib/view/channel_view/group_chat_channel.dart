import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/controller/channel_controller.dart';
import 'package:groupidy/controller/chat_controller.dart';
import 'package:groupidy/view/components/messages_container.dart';
import 'package:groupidy/view/components/textfield_bar.dart';

import '../../colors.dart';
import '../../typography.dart';

class GroupChatChannel extends StatefulWidget {
  const GroupChatChannel({Key? key}) : super(key: key);
  @override
  _GroupChatChannelState createState() => _GroupChatChannelState();
}

class _GroupChatChannelState extends State<GroupChatChannel> {
  var channelController = Get.find<ChannelController>();
  var chatController = Get.put(ChatController());

  @override
  void initState() {
    chatController.loadChat(channelController.getCid());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Obx(() => MessagesContainer(
                chat: chatController.getChat(),
                myUid: '',
              ))),
              TextFieldBar(
                onSend: (s) => chatController.addMessage(s),
                outerPadding: 16,
                textStyle: kBodyRegular.copyWith(color: kWhite),
                hintStyle: kBodyRegular.copyWith(color: kWhiteDisabled),
              ),
            ]),
      ),
    );
  }
}
