import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/controller/channel_controller.dart';
import 'package:chatapp/controller/chat_controller.dart';
import 'package:chatapp/controller/user_controller.dart';
import 'package:chatapp/view/components/messages_container.dart';
import 'package:chatapp/view/components/textfield_bar.dart';

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
  var userController = Get.put(UserController());
  var _scrollController = ScrollController();

  @override
  void initState() {
    chatController.loadChat(channelController.getCid());
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge && _scrollController.offset != 0) {
        chatController.loadOldMessages();
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant GroupChatChannel oldWidget) {
    chatController.loadChat(channelController.getCid());
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
              child: Obx(() => MessagesContainer(
                    chat: chatController.getChat(),
                    myUid: userController.user.value!.uid,
                    scrollController: _scrollController,
                  ))),
          TextFieldBar(
            onSend: (s) => chatController.addMessage(s, userController.user.value!.uid, userController.user.value!.nickname),
            outerPadding: 16,
            textStyle: kBodyRegular.copyWith(color: kWhite),
            hintStyle: kBodyRegular.copyWith(color: kWhiteDisabled),
          ),
        ]),
      ),
    );
  }
}
