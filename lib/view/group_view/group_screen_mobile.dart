import 'package:flutter/material.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/view/components/bar_info.dart';

class GroupScreenMobile extends StatefulWidget {
  const GroupScreenMobile({
    Key? key,
    required this.group,
    required this.currChannel,
  }) : super(key: key);

  final Group group;
  final Channel currChannel;

  @override
  _GroupScreenMobileState createState() => _GroupScreenMobileState();
}

class _GroupScreenMobileState extends State<GroupScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          BarInfo(
            title: widget.group.name,
            subTitle: widget.currChannel.name,
            itemInfoClick: () => {},
          ),
        ],
      ),
    ));
  }
}
