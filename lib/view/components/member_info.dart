import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/controller/group_controller.dart';
import 'package:groupidy/model/user.dart';
import 'package:groupidy/services/firestore_service.dart';
import 'package:groupidy/services/storage_service.dart';

import '../../colors.dart';
import '../../dummy_data.dart';
import '../../typography.dart';
import 'circle_image.dart';

class MemberInfo extends StatefulWidget {
  const MemberInfo({Key? key, required this.uid, this.isOwner})
      : super(key: key);

  final String uid;
  final isOwner;

  @override
  _MemberInfoState createState() => _MemberInfoState();
}

class _MemberInfoState extends State<MemberInfo> {
  GroupController groupController = Get.find();
  var _user = UserGp(uid: '', tag: '', nickname: '');
  var _imageDownloadUrl = '';

  @override
  void initState() {
    FirestoreService.getUser(widget.uid, (UserGp? user) {
      if (user != null) {
        setState(() {
          _user = user;
          StorageService.getDownloadUrl(user.imgPath)
            .then((downloadUrl) {
              setState(() {
                _imageDownloadUrl = downloadUrl;
              });
            });
        });
      }
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
            size: 32,
            imagePath: _imageDownloadUrl,
          ),
          SizedBox(width: 8,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              _user.nickname,
              style: kBodyRegular.copyWith(color: kWhite),
            ),
          ),
          Visibility(
            child: Tooltip(
                message: "Group owner",
                textStyle: kCaption.copyWith(color: kWhite),
                child: Icon(
                  Icons.vpn_key_sharp,
                  size: 16,
                  color: kWhite,
                )),
            visible: widget.isOwner,
          )
        ],
      ),
    );
  }
}
