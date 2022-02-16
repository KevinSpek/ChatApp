import 'package:flutter/material.dart';
import 'package:chatapp/colors.dart';
import 'package:chatapp/dummy_data.dart';
import 'package:chatapp/model/chat.dart';
import 'package:chatapp/typography.dart';
import 'package:chatapp/view/components/circle_image.dart';
import 'package:chatapp/view/components/custom_icon_button.dart';
import 'package:chatapp/view/components/messages_container.dart';
import 'package:chatapp/view/components/textfield_bar.dart';

import 'home_chatidy_menu.dart';

class HomeChatidy extends StatefulWidget {
  const HomeChatidy({Key? key}) : super(key: key);

  @override
  _HomeChatidyState createState() => _HomeChatidyState();
}

class _HomeChatidyState extends State<HomeChatidy> {
  List<Chat> _chats = dChats;
  String _myUid = dUid;
  int _currentChatIndex = 0;
  bool _showAddChat = false;

  void _handleChatClick(int index) {
    setState(() {
      _currentChatIndex = index;
    });
  }

  void _handleShowAddChat() {
    setState(() {
      _showAddChat = !_showAddChat;
    });
  }

  void _handleAddChat(String userTag) {
    // todo
  }

  void handleSendMessage(String message) {
    // todo
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryBackground,
      child: Row(
        children: [
          SizedBox(
            child: ChatidyMenu(
              onChatClick: _handleChatClick,
              chats: _chats,
              onShowAddChat: _handleShowAddChat,
              onAddChat: _handleAddChat,
              showAddChat: _showAddChat,
            ),
            width: 300,
            height: double.infinity,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 80,
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: CircleImage(
                            size: 48,
                            imagePath: _chats[_currentChatIndex].userToChat.imgPath,
                          ),
                        ),
                        Expanded(
                            child: Text(
                          _chats[_currentChatIndex].userToChat.nickname,
                          style: kBodyRegular.copyWith(color: kWhite),
                        )),
                        CustomIconButton(
                          icon: Icons.settings_rounded,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: kSecondaryBackground,
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Expanded(
                          child: MessagesContainer(
                        chat: _chats[_currentChatIndex],
                        myUid: _myUid,
                        scrollController: ScrollController(),
                      )),
                      TextFieldBar(
                        onSend: handleSendMessage,
                        outerPadding: 16,
                        textStyle: kBodyRegular.copyWith(color: kWhite),
                        hintStyle: kBodyRegular.copyWith(color: kWhiteDisabled),
                      ),
                    ]),
                  ),
                )
              ],
            ),
            flex: 3,
          )
        ],
      ),
    );
  }
}
