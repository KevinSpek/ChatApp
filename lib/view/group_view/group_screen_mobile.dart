import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/constants.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/view/components/bar_info.dart';
import 'package:groupidy/view/components/button.dart';
import 'package:groupidy/view/components/circle_image.dart';
import 'package:groupidy/view/components/custom_icon_button.dart';
import 'package:groupidy/view/group_view/channel_presentor.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
  PanelController _pc = new PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SlidingUpPanel(
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      controller: _pc,
      minHeight: 0,
      maxHeight: 200,
      isDraggable: false,
      backdropEnabled: true,
      color: kSecondaryBackground,
      borderRadius: BorderRadius.all(Radius.circular(kRadius)),
      panel: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Button(
            width: MediaQuery.of(context).size.width - 96,
            onPressed: () {},
            text: "Create Channel",
            backgroundColor: kSecondaryBubble,
          ),
          SizedBox(height: 10),
          Button(
            width: MediaQuery.of(context).size.width - 96,
            onPressed: () {},
            text: "Edit Channel",
            backgroundColor: kSecondaryBubble,
          ),
          SizedBox(height: 10),
          Button(
            width: MediaQuery.of(context).size.width - 96,
            onPressed: () {},
            text: "Delete Channel",
            backgroundColor: kSecondaryBubble,
          ),
        ],
      ),
      body: Container(
        color: kSecondaryBackground,
        child: Column(
          children: [
            BarInfo(
              leftWidget: CustomIconButton(
                icon: Icons.arrow_back,
                onPressed: () {
                  Get.toNamed('/home');
                },
              ),
              rightWidget: CustomIconButton(
                icon: Icons.menu,
                onPressed: () {
                  _pc.open();
                },
              ),
              title: widget.group.name,
              subTitle: widget.currChannel.name,
              itemInfoClick: () => {},
              color: kPrimaryColor,
            ),
            Container(
              height: 84,
              width: MediaQuery.of(context).size.width,
              color: kPrimaryColor,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: widget.group.pids.map((pid) {
                    // TODO: extract channel image...
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () {
                          // TODO: on click change currChannel!
                        },
                        child: Column(
                          children: [
                            Spacer(),
                            CircleImage(
                              size: 64,
                              placeholderBackgroundColor: kWhiteSecondary.withOpacity(pid == widget.currChannel.pid ? 1 : 0.64),
                            ),
                            Spacer(),
                            Visibility(
                              child: Container(height: 2, width: 64, color: kWhite),
                              visible: pid == widget.currChannel.pid,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            ChannelPresentor(channel: widget.currChannel),
          ],
        ),
      ),
    ));
  }
}
