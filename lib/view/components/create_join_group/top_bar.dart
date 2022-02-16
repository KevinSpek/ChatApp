import 'package:flutter/material.dart';
import 'package:chatapp/colors.dart';
import 'package:chatapp/typography.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key, required this.isJoinGroup, required this.onToggleJoinGroup, required this.onToggleCreateGroup}) : super(key: key);

  final bool isJoinGroup;
  final VoidCallback onToggleJoinGroup;
  final VoidCallback onToggleCreateGroup;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TopButton(
                text: "Join Group",
                selected: isJoinGroup,
                onClick: onToggleJoinGroup,
              )),
              Expanded(
                  child: TopButton(
                text: "New Group",
                selected: !isJoinGroup,
                onClick: onToggleCreateGroup,
              )),
            ],
          ),
          Divider(
            color: kWhiteDisabled,
            height: 1,
          )
        ],
      ),
    );
  }
}

class TopButton extends StatelessWidget {
  const TopButton({Key? key, required this.text, required this.selected, required this.onClick}) : super(key: key);

  final String text;
  final bool selected;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        child: Text(text, style: kBodyRegular.copyWith(color: selected ? kWhite : kWhiteSecondary)),
      ),
    );
  }
}
