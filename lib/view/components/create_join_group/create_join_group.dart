import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatapp/colors.dart';
import 'package:chatapp/controller/home_controller.dart';
import 'package:chatapp/controller/user_controller.dart';
import 'package:chatapp/services/firestore_service.dart';
import 'package:chatapp/utils.dart';
import 'package:chatapp/view/components/create_join_group/create_group.dart';
import 'package:chatapp/view/components/create_join_group/join_group.dart';
import 'package:chatapp/view/components/create_join_group/top_bar.dart';

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
  String _insertedTag = "";
  var userController = Get.find<UserController>();
  var homeController = Get.find<HomeController>();

  void handleCancel(BuildContext context) {
    Navigator.pop(context);
  }

  void handleCreateGroup(BuildContext contex) {
    if (_insertedTag.length > 3) {
      FirestoreService.createGroup(_insertedTag, userController.user.value!.uid).then((group) {
        userController.user.value?.gids.add(group.gid);
        homeController.groups.value.add(group);
        Navigator.pop(context);
      });
    }
  }

  void handleJoinGroup() {
    if (isValidTag(_insertedTag)) {
      var tagData = _insertedTag.split("#");
      homeController.joinGroup(
          name: tagData[0],
          tag: tagData[1],
          uid: userController.user.value!.uid,
          onNotExists: () {
            setState(() {
              _groupNotExists = true;
            });
          },
          onSucess: () {
            showToast(context, "Joined to group successfully");
            Navigator.pop(context);
          },
          onExists: () {
            setState(() {
              _alreadyInTheGroup = true;
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
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: kSecondaryBackground),
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
                  onCancel: () => handleCancel(context),
                  onTextChanged: handleTagChange,
                  onMainButtonClick: handleJoinGroup,
                  invalidTag: _invalidTag,
                  groupNotExists: _groupNotExists,
                  alreadyInTheGroup: _alreadyInTheGroup,
                )
              : CreateGroup(
                  onCancel: () => handleCancel(context),
                  onTextChanged: handleTagChange,
                  onMainButtonClick: () => handleCreateGroup(context),
                ),
        ],
      ),
    );
  }
}
