import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/controller/home_controller.dart';
import 'package:groupidy/utils.dart';
import 'package:groupidy/view/components/create_join_group/create_join_group.dart';
import 'package:groupidy/view/home_views/groups_view/group_add_item.dart';
import 'package:groupidy/view/home_views/groups_view/group_list_item.dart';

class HomeGroups extends StatefulWidget {
  const HomeGroups({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeGroups> createState() => _HomeGroupsState();
}

class _HomeGroupsState extends State<HomeGroups> {
  HomeController homeController = Get.find();

  
  void _handleGroupTap(String gid) {
    homeController.navigateToGroup(gid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBackground,
      floatingActionButton: Visibility(
        child: FloatingActionButton(
          onPressed: () => dialog(context: context, child: CreateJoinGroup()),
          backgroundColor: kAccentColor,
          child: SvgPicture.asset(
            "group.svg",
            height: 32,
            width: 32,
            color: kWhite,
          ),
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
            child: Obx(
              () => ListView.separated(
                  itemBuilder: (context, index) {
                    return GroupListItem(
                      group: homeController.groups.value[index],
                      onTap: _handleGroupTap,
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        color: kWhiteSecondary.withOpacity(0.3),
                        height: 2,
                      ),
                  itemCount: homeController.groups.value.length),
            ),
          ),
        ],
      ),
    );
  }
}
