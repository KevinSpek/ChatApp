import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/model/channels/channel.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/utils.dart';
import 'package:groupidy/view/components/button.dart';
import 'package:groupidy/view/components/circle_image.dart';
import 'package:groupidy/view/components/custom_editable_text.dart';
import 'package:groupidy/view/components/members.dart';
import 'package:groupidy/view/group_view/channel_image_change.dart';

class ChannelInformation extends StatefulWidget {
  const ChannelInformation({Key? key, required this.channel}) : super(key: key);

  final Channel channel;

  @override
  _ChannelInformationState createState() => _ChannelInformationState();
}

class _ChannelInformationState extends State<ChannelInformation> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                CircleImage(
                  size: 120,
                  imagePath: widget.channel.imgPath,
                  useText: !widget.channel.isImage,
                  text: widget.channel.iconText,
                  padding: EdgeInsets.only(right: 32, bottom: 32),
                  onClick: () => dialog(
                      context: context,
                      child: ChannelImageChange(channel: widget.channel)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomEditableText(
                      initialText: widget.channel.name,
                      textStyle: kSubTitle.copyWith(color: kWhite),
                      maxLines: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        widget.channel.getTypeString(),
                        style: kBodyRegular.copyWith(color: kWhiteSecondary),
                      ),
                    )
                  ],
                )
              ],
            ),
            CustomEditableText(
              hint: "Insert channel description",
              initialText: widget.channel.desc,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Divider(
                height: 0.5,
                color: kWhiteDisabled,
              ),
            ),
            widget.channel.isLimited
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          'This channel is Limited.',
                          style: kBodyRegular.copyWith(color: kWhiteSecondary),
                        ),
                      ),
                      Members(
                        membersUids:
                            widget.channel.uidsAllowed ?? List<String>.empty(),
                        title: 'Channel members',
                      ),
                      Button(
                        onPressed: () => {},
                        text: 'Transform to normal channel',
                        width: 350,
                        margin: EdgeInsets.only(top: 32),
                      ),
                      Text(
                        'This will make the channel accesible for all group memebers',
                        style: kBodyRegular.copyWith(color: kWhiteSecondary),
                      ),
                    ],
                  )
                : Text(
                    "This channel is Normal, Everyone in the group can enter it.",
                    style: kBodySmall.copyWith(color: kWhiteSecondary),
                  )
          ],
        ),
      ),
    );
  }
}
