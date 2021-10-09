import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/bar_info.dart';
import 'package:groupidy/view/components/custom_icon_button.dart';
import 'package:groupidy/view/group_view/channel_information.dart';
import 'package:groupidy/view/group_view/group_menu.dart';

import 'channel_presentor.dart';
import 'group_information.dart';

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
  bool _showChannelInformation = false;

  @override
  void initState() {
    if (widget.group.pids.length == 0) return;
    setState(() {
      _currentChannel = dChannels.firstWhere((channel) => channel.pid == widget.group.pids[0]);
      _showGroupProfile = false;
      _showChannelInformation = false;
    });
    super.initState();
  }

  void handleChannelChange(Channel channel) {
    setState(() {
      _currentChannel = channel;
      _showGroupProfile = false;
      _showChannelInformation = false;
    });
  }

  void _handleShowGroupProfile() {
    setState(() {
      _showGroupProfile = true;
      _showChannelInformation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool noText = MediaQuery.of(context).size.width < 1200;
    final double menuWidth = noText ? 80 : 332;
    return Scaffold(
        body: Row(
      children: [
        Container(
          width: menuWidth,
          child: GroupMenu(
            noText: noText,
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
                  rightWidget: Row(
                    children: [
                      Icon(Icons.person_add, color: kWhite),
                      SizedBox(width: 12),
                      Text('Invite Friends', style: kBodySmall.copyWith(color: kWhite)),
                    ],
                  )),
              _showGroupProfile
                  ? GroupInformation(group: widget.group)
                  : BarInfo(
                      title: _currentChannel.name,
                      imagePath: _currentChannel.imgPath,
                      subTitle: _currentChannel.getTypeString(),
                      color: kAccentColor.withOpacity(0.8),
                      useIconText: !_currentChannel.isImage,
                      iconText: _currentChannel.iconText,
                      itemInfoClick: () => setState(() {
                        _showChannelInformation = true;
                      }),
                      rightWidget: Row(
                        children: [
                          CustomIconButton(icon: Icons.settings_rounded),
                          SizedBox(width: 12),
                          CustomIconButton(icon: Icons.search_rounded),
                        ],
                      ),
                    ),
              Visibility(
                child: _showChannelInformation
                    ? ChannelInformation(
                        channel: _currentChannel,
                      )
                    : ChannelPresentor(channel: _currentChannel),
                visible: !_showGroupProfile,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
