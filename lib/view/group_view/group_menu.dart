import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/controller/channel_controller.dart';
import 'package:groupidy/controller/group_controller.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/notification_message.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/utils.dart';
import 'package:groupidy/view/components/circle_image.dart';
import 'package:groupidy/view/components/create_new_channel/create_new_channel.dart';
import 'package:groupidy/view/components/custom_icon_button.dart';
import 'package:groupidy/view/group_view/channel_list_item.dart';

class GroupMenu extends StatefulWidget {
  const GroupMenu({
    Key? key,
  }) : super(key: key);

  @override
  _GroupMenuState createState() => _GroupMenuState();
}

class _GroupMenuState extends State<GroupMenu> {
  GroupController groupController = Get.find();
  ChannelController channelController = Get.find();

  void _handleReturnHome() {
    Get.offNamed('/home');
  }

  void handleChannelChange(Channel channel) {
    groupController.handleChannelChange(channel);
    channelController.handleChannelChange(channel);
  }

  @override
  Widget build(BuildContext context) {
    final bool noText = MediaQuery.of(context).size.width < 1200;
    final double menuWidth = noText ? 80 : 332;

    return Container(
      width: menuWidth,
      color: kPrimaryColor,
      child: Column(
        children: [
          noText
              ? CustomIconButton(
                  icon: Icons.arrow_back_rounded,
                  onPressed: _handleReturnHome,
                )
              : Row(
                  children: [
                    CustomIconButton(
                      icon: Icons.arrow_back_rounded,
                      onPressed: _handleReturnHome,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Groupidy',
                      style: kBodyRegular.copyWith(color: kWhite),
                    ),
                  ],
                ),
          SizedBox(height: noText ? 8 : 36),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: noText
                ? Column(
                    children: [
                      CustomIconButton(icon: Icons.search),
                      CustomIconButton(
                        icon: Icons.add,
                        onPressed: () {groupController.changeMode(Mode.add);},//() => dialog(context: context, child: CreateNewChannel()),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Text(
                        'Channels',
                        style: kBodySmall.copyWith(color: kWhite),
                      ),
                      Spacer(),
                      CustomIconButton(icon: Icons.search),
                      CustomIconButton(
                        icon: Icons.add,
                        onPressed: () {groupController.changeMode(Mode.add);},
                      ),
                    ],
                  ),
          ),
          Divider(
            color: kWhiteSecondary.withOpacity(0.5),
            height: 2,
          ),
          Expanded(
            child: Obx(() => ListView.separated(
                  itemCount: channelController.channels.value.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(
                    height: 1,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    Channel channel = channelController.channels.value[index];
                    return noText
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () => handleChannelChange(channel),
                              child: CircleImage(
                                size: 64,
                                imagePath: channel.imgPath,
                                useText: !channel.isImage,
                                text: channel.iconText,
                              ),
                            ),
                          )
                        : ChannelListItem(
                            channel: channel,
                            notifications: [
                              NotificationMessage(
                                chatID: '123',
                                notificationType: NotificationType.chatidy,
                                numNewMessages: 5,
                                time: DateTime.now(),
                              ),
                              NotificationMessage(
                                chatID: '123',
                                notificationType: NotificationType.forum,
                                numNewMessages: 5,
                                time: DateTime.now(),
                              ),
                              NotificationMessage(
                                chatID: '123',
                                notificationType: NotificationType.news,
                                numNewMessages: 5,
                                time: DateTime.now(),
                              ),
                            ],
                            onTap: () => handleChannelChange(channel),
                          );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
