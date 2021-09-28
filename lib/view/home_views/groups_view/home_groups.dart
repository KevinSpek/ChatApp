import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/utils.dart';
import 'package:groupidy/view/components/create_join_group/create_join_group.dart';
import 'package:groupidy/view/home_views/groups_view/group_add_item.dart';
import 'package:groupidy/view/home_views/groups_view/group_list_item.dart';

class HomeGroups extends StatelessWidget {
  const HomeGroups({
    Key? key,
    required this.groups,
  }) : super(key: key);

  final List<Group> groups;

  void _handleGroupTap(String groupID) {
    // TODO: Save the clicked grouped in a controller
    Get.toNamed('/group');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBackground,
      floatingActionButton: Visibility(
        child: FloatingActionButton(
          onPressed: () => dialog(context: context, child: CreateJoinGroup()),
          backgroundColor: kAccentColor,
          child: SvgPicture.asset("group.svg", height: 32, width: 32, color: kWhite,),
        ),
        visible: context.isPhone,
      ),
      body: Column(
        children: [
          Visibility(
            child: GroupAddItem(
              onClick: () => dialog(context: context, child: CreateJoinGroup()),
            ),
            visible: !context.isPhone,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return GroupListItem(
                    group: groups[index],
                    onTap: _handleGroupTap,
                  );
                },
                separatorBuilder: (context, index) => Divider(
                      color: kWhiteSecondary.withOpacity(0.3),
                      height: 2,
                    ),
                itemCount: groups.length),
          ),
        ],
      ),
    );
  }
}
