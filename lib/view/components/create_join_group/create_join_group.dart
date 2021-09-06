import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/view/components/create_join_group/create_group.dart';
import 'package:groupidy/view/components/create_join_group/join_group.dart';
import 'package:groupidy/view/components/create_join_group/top_bar.dart';

class CreateJoinGroup extends StatefulWidget {
  const CreateJoinGroup({Key? key}) : super(key: key);

  @override
  _CreateJoinGroupState createState() => _CreateJoinGroupState();
}

class _CreateJoinGroupState extends State<CreateJoinGroup> {
  bool _isJoinGroup = false;
  bool _invalidTag = false;
  String _insertedTag = "";

  void handleCancel() {}

  void handleCreateGroup() {
    if (isValidTag(_insertedTag)) {
      // create group
    }
  }

  void handleJoinGroup() {
    if (isValidTag(_insertedTag)) {
      // attempt join group
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
      _invalidTag = !isValid;
    });
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                )
              : CreateGroup(
                  onCancel: handleCancel,
                  onTextChanged: handleTagChange,
                  onMainButtonClick: handleCreateGroup,
                ),
        ],
      ),
    ));
  }
}