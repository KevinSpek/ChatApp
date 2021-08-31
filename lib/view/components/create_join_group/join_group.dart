import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/create_join_group/bottom_buttons.dart';

class JoinGroup extends StatelessWidget {
  const JoinGroup(
      {Key? key,
      required this.onCancel,
      required this.onTextChanged,
      required this.onMainButtonClick,
      this.invalidTag = false})
      : super(key: key);

  final VoidCallback onCancel;
  final Function(String) onTextChanged;
  final VoidCallback onMainButtonClick;
  final bool invalidTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Group tag",
            style: kBodyRegular.copyWith(color: kWhite),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              maxLength: 40,
              onChanged: onTextChanged,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: "Example: groupidy#aB12",
                counterText: "",
                hintStyle: kBodyRegular.copyWith(color: kWhiteDisabled),
              ),
              style: kBodyRegular.copyWith(color: Colors.white),
            ),
          ),
          Visibility(
            child: Text(
              "* Invalid tag",
              style: kBodySmall.copyWith(color: kError),
            ),
            visible: invalidTag,
          ),
          Visibility(
            child: Text(
              "* Group not exists or invalid tag",
              style: kBodySmall.copyWith(color: kError),
            ),
            visible: false,
          ),
          BottomButtons(
            mainButtonText: "Join",
            onMainButtonClick: onMainButtonClick,
            onCancelClick: onCancel,
          )
        ],
      ),
    );
  }
}
