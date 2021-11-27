import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/custom_dropdown.dart';
import 'package:groupidy/view/components/custom_text_field.dart';

class ChannelCreate extends StatefulWidget {
  const ChannelCreate({Key? key}) : super(key: key);

  @override
  _ChannelCreateState createState() => _ChannelCreateState();
}

class _ChannelCreateState extends State<ChannelCreate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Create Channel', style: kBodyLarge.copyWith(color: kWhite)),
          CustomTextField(
            onValueChange: (s) {},
            labelText: 'Channel name',
            hintText: 'Example: News & Updates',
            padding: EdgeInsets.only(top: 32, bottom: 16),
          ),
          CustomDropdown(items: ['News', 'Group chat', 'Forum'],)
        ],
      ),
    );
  }
}
