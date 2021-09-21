import 'package:flutter/material.dart';
import 'package:groupidy/model/user.dart';

import '../../colors.dart';
import '../../dummy_data.dart';
import '../../typography.dart';
import 'circle_image.dart';

class MemberInfo extends StatefulWidget {
  const MemberInfo({Key? key, required this.uid}) : super(key: key);

  final String uid;
  
  @override
  _MemberInfoState createState() => _MemberInfoState();
}

class _MemberInfoState extends State<MemberInfo> {
  User _user = User(uid: '', tag: '', nickname: '');

  @override
  void initState() {
    setState(() {
      _user = dUsers.firstWhere((user) => user.uid == widget.uid);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleImage(
            size: 24,
            imagePath: _user.imgPath,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(_user.nickname, style: kBodyRegular.copyWith(color: kWhite),),
          )
        ],
      ),
    );
  }
}