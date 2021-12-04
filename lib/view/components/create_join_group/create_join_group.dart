import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/controller/home_controller.dart';
import 'package:groupidy/controller/user_controller.dart';
import 'package:groupidy/services/firestore_service.dart';
import 'package:groupidy/utils.dart';
import 'package:groupidy/view/components/create_join_group/create_group.dart';
import 'package:groupidy/view/components/create_join_group/join_group.dart';
import 'package:groupidy/view/components/create_join_group/top_bar.dart';
import 'package:groupidy/view/components/loading.dart';

class CreateJoinGroup extends StatefulWidget {
  const CreateJoinGroup({Key? key}) : super(key: key);

  @override
  _CreateJoinGroupState createState() => _CreateJoinGroupState();
}

class _CreateJoinGroupState extends State<CreateJoinGroup> {
  bool _isJoinGroup = false;
  bool _invalidTag = false;
  bool _groupNotExists = false;
  bool _alreadyInTheGroup = false;
  bool _loading = false;
  String _insertedTag = "";
  var userController = Get.find<UserController>();
  var homeController = Get.find<HomeController>();

  void handleCancel() {}

  void handleCreateGroup() {
    if (_insertedTag.length > 3) {
      FirestoreService.createGroup(
          _insertedTag, userController.user.value!.uid);
    }
  }

  void handleJoinGroup() {
    if (isValidTag(_insertedTag)) {
      // TODO: attempt join group
      var tagData = _insertedTag.split("#");
      setState(() {
        _loading = true;
      });
      homeController.joinGroup(
          name: tagData[0],
          tag: tagData[1],
          uid: userController.user.value!.uid,
          onNotExists: () {
            setState(() {
              _groupNotExists = true;
              _loading = false;
            });
          },
          onSucess: () {
            showToast(context, "Joined to group successfully");
            Navigator.pop(context);
          },
          onExists: () {
            setState(() {
              _alreadyInTheGroup = true;
              _loading = false;
            });
          });
    }
  }

  void handleTagChange(String newTagName) {
    setState(() {
      _insertedTag = newTagName;
    });
  }

  void toggleJoinGroup() {
    setState(() {
      _isJoinGroup = true;
      _invalidTag = false;
      _groupNotExists = false;
      _alreadyInTheGroup = false;
      _loading = false;
      _insertedTag = "";
    });
  }

  void toggleCreateGroup() {
    setState(() {
      _isJoinGroup = false;
      _insertedTag = "";
    });
  }

  bool isValidTag(String tag) {
    var tagData = tag.split("#");
    bool isValid = false;

    if (tagData.length <= 1 || tagData[0].length < 2) {
      isValid = false;
    }

    if (tagData.length == 2 && tagData[1].length == 4) {
      isValid = true;
    }

    setState(() {
      _groupNotExists = false;
      _alreadyInTheGroup = false;
      _invalidTag = !isValid;
    });
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: kSecondaryBackground),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TopBar(
            isJoinGroup: _isJoinGroup,
            onToggleCreateGroup: toggleCreateGroup,
            onToggleJoinGroup: toggleJoinGroup,
          ),
          _isJoinGroup
              ? JoinGroup(
                  onCancel: handleCancel,
                  onTextChanged: handleTagChange,
                  onMainButtonClick: handleJoinGroup,
                  invalidTag: _invalidTag,
                  groupNotExists: _groupNotExists,
                  alreadyInTheGroup: _alreadyInTheGroup,
                )
              : CreateGroup(
                  onCancel: handleCancel,
                  onTextChanged: handleTagChange,
                  onMainButtonClick: handleCreateGroup,
                ),
        ],
      ),
    );
  }
}
