import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/item_image.dart';
import 'package:groupidy/view/group_view/channel_presentor.dart';
import 'package:groupidy/view/group_view/group_manu.dart';

class GroupScreenDesktop extends StatelessWidget {
  const GroupScreenDesktop({
    Key? key,
    required this.group,
    required this.currChannel,
  }) : super(key: key);
  final double menuWidth = 332;
  final Group group;
  final Channel currChannel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Container(
          width: menuWidth,
          child: GroupMenu(
            groups: dGroups,
          ),
        ),
        Container(
          color: kSecondaryBackground,
          width: MediaQuery.of(context).size.width - menuWidth,
          child: Column(
            children: [
              Container(
                color: kAccentColor,
                height: 64,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ItemImage(),
                      SizedBox(width: 12),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${group.name}', style: kBodyLarge.copyWith(color: kWhite, fontWeight: FontWeight.bold)),
                          Text('${group.uids.length}  Users', style: kCaption.copyWith(color: kWhite.withOpacity(0.6))),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.person_add, color: kWhite),
                      SizedBox(width: 12),
                      Text('Invite Friends', style: kBodySmall.copyWith(color: kWhite)),
                    ],
                  ),
                ),
              ),
              Container(
                color: kAccentColor.withOpacity(0.8),
                height: 64,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ItemImage(),
                      SizedBox(width: 12),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${currChannel.name}', style: kBodyLarge.copyWith(color: kWhite, fontWeight: FontWeight.bold)),
                          Text('Channel information', style: kCaption.copyWith(color: kWhite.withOpacity(0.6))),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.settings_outlined, color: kWhite),
                      SizedBox(width: 12),
                      Icon(Icons.search_outlined, color: kWhite),
                    ],
                  ),
                ),
              ),
              ChannelPresentor(channel: currChannel),
            ],
          ),
        ),
      ],
    ));
  }
}
