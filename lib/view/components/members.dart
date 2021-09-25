import 'package:flutter/material.dart';
import '../../colors.dart';
import '../../typography.dart';
import 'member_info.dart';

class Members extends StatelessWidget {
  const Members(
      {Key? key,
      required this.membersUids,
      this.title = '',
      this.onUserAdd,
      this.ownerUid = ''})
      : super(key: key);

  final List<String> membersUids;
  final String ownerUid;
  final String title;
  final VoidCallback? onUserAdd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: kBodyRegular.copyWith(color: kWhite),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: onUserAdd,
                      icon: Icon(
                        Icons.person_add_rounded,
                        color: kWhite,
                        size: 24,
                      ))
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kWhiteSecondary),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: membersUids
                .map((uid) => MemberInfo(
                      uid: uid,
                      isOwner: uid == ownerUid,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
