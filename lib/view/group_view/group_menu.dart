import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/colors.dart';
import 'package:chatapp/controller/channel_controller.dart';
import 'package:chatapp/controller/group_controller.dart';
import 'package:chatapp/controller/user_controller.dart';
import 'package:chatapp/model/channels/channel.dart';
import 'package:chatapp/typography.dart';
import 'package:chatapp/view/components/circle_image.dart';
import 'package:chatapp/view/components/custom_icon_button.dart';
import 'package:chatapp/view/group_view/channel_list_item.dart';

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
  UserController userController = Get.find();

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
                      'BondBox',
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
                      Obx(() => groupController.isGroupAdmin(userController.getUserUid())
                          ? CustomIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                groupController.changeMode(Mode.add);
                              },
                            )
                          : SizedBox.shrink()),
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
                      Obx(() => groupController.isGroupAdmin(userController.getUserUid())
                          ? CustomIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                groupController.changeMode(Mode.add);
                              },
                            )
                          : SizedBox.shrink()),
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
                            notifications: [],
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
