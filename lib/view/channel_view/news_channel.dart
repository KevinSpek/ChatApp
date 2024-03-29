import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/colors.dart';
import 'package:chatapp/controller/channel_controller.dart';
import 'package:chatapp/controller/chat_controller.dart';
import 'package:chatapp/controller/user_controller.dart';
import 'package:chatapp/typography.dart';
import 'package:chatapp/view/components/messages_container.dart';
import 'package:chatapp/view/components/textfield_bar.dart';

class NewsChannel extends StatefulWidget {
  const NewsChannel({Key? key}) : super(key: key);

  @override
  State<NewsChannel> createState() => _NewsChannelState();
}

class _NewsChannelState extends State<NewsChannel> {
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
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          children: [
            Obx(() => Expanded(
                    child: MessagesContainer(
                  chat: chatController.getChat(),
                  myUid: userController.getUserUid(),
                  scrollController: _scrollController,
                ))),
            Obx(() => channelController.getUidsAllowedToWrite().contains(userController.getUserUid())
                ? TextFieldBar(
                    onSend: (s) => chatController.addMessage(s, userController.user.value!.uid, userController.user.value!.nickname),
                    outerPadding: 16,
                    textStyle: kBodyRegular.copyWith(color: kWhite),
                    hintStyle: kBodyRegular.copyWith(color: kWhiteDisabled),
                  )
                : Container(
                    width: double.infinity,
                    color: Colors.white.withOpacity(0.05),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'This is a news channel.\nOnly admins can type here.',
                        style: kBodySmall.copyWith(
                          color: kWhiteSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
