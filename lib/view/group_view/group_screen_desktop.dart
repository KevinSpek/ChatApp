import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/utils.dart';
import 'package:groupidy/view/components/bar_info.dart';
import 'package:groupidy/view/components/circle_image.dart';
import 'package:groupidy/view/components/edit_channel/edit_channel.dart';
import 'package:groupidy/view/components/item_info.dart';
import 'package:groupidy/view/group_view/group_menu.dart';
import 'package:groupidy/view/group_view/group_profile.dart';

import 'channel_presentor.dart';

class GroupScreenDesktop extends StatefulWidget {
  const GroupScreenDesktop({
    Key? key,
    required this.group,
    required this.currChannel,
  }) : super(key: key);

  final Group group;
  final Channel currChannel;

  @override
  _GroupScreenDesktopState createState() => _GroupScreenDesktopState();
}

class _GroupScreenDesktopState extends State<GroupScreenDesktop> {
  final double menuWidth = 332;

  Channel _currentChannel = dChannel3;
  bool _showGroupProfile = false;

  @override
  void initState() {
    if (widget.group.pids.length == 0) return;
    setState(() {
      _currentChannel = dChannels
          .firstWhere((channel) => channel.pid == widget.group.pids[0]);
      _showGroupProfile = false;
    });
    super.initState();
  }

  void handleChannelChange(Channel channel) {
    setState(() {
      _currentChannel = channel;
      _showGroupProfile = false;
    });
  }

  void _handleShowGroupProfile() {
    setState(() {
      _showGroupProfile = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Container(
          width: menuWidth,
          child: GroupMenu(
            pids: widget.group.pids,
            onChannelChange: handleChannelChange,
          ),
        ),
        Container(
          color: kSecondaryBackground,
          width: MediaQuery.of(context).size.width - menuWidth,
          child: Column(
            children: [
              BarInfo(
                  title: widget.group.name,
                  imagePath: widget.group.imgPath,
                  subTitle: '${widget.group.uids.length} Users',
                  itemInfoClick: _handleShowGroupProfile,
                  sideWidget: Row(
                    children: [
                      Icon(Icons.person_add, color: kWhite),
                      SizedBox(width: 12),
                      Text('Invite Friends',
                          style: kBodySmall.copyWith(color: kWhite)),
                    ],
                  )),
              _showGroupProfile
                  ? GroupProfile(group: widget.group)
                  : BarInfo(
                      title: _currentChannel.name,
                      imagePath: _currentChannel.imgPath,
                      subTitle: _currentChannel.getTypeString(),
                      color: kAccentColor.withOpacity(0.8),
                      useIconText: !_currentChannel.isImage,
                      iconText: _currentChannel.iconText,
                      sideWidget: Row(
                        children: [
                          IconButton(
                              onPressed: () => dialog(context: context, child: EditChannel(channel: _currentChannel,),),
                              icon:
                                  Icon(Icons.settings_outlined, color: kWhite)),
                          SizedBox(width: 12),
                          Icon(Icons.search_outlined, color: kWhite),
                        ],
                      ),
                    ),
              Visibility(
                child: ChannelPresentor(channel: _currentChannel),
                visible: !_showGroupProfile,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
