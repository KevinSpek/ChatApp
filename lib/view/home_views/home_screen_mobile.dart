import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/controller/home_controller.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/custom_icon_button.dart';
import 'package:groupidy/view/home_views/groups_view/home_groups.dart';
import 'package:groupidy/view/home_views/home_type.dart';
import 'package:groupidy/view/home_views/profile_view/home_profile_mobile.dart';
import 'package:groupidy/view/home_views/settings_view/home_settings.dart';

import 'chatidy_view/home_chatidy mobile.dart';


HomeType getHomeTypeFromPageIndex(int pageIndex) {
  switch (pageIndex) {
    case 1:
      return HomeType.chatidy;
    case 0:
      return HomeType.groups;
    case 2:
      return HomeType.profile;
    default:
      return HomeType.groups;
  }
}

int getPageIndexFromHomeType(HomeType homeType) {
  switch (homeType) {
    case HomeType.chatidy:
      return 1;
    case HomeType.groups:
      return 0;
    case HomeType.profile:
      return 2;
    default:
      return 0;
  }
}

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  _HomeScreenMobileState createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile>
    with TickerProviderStateMixin {
  late TabController _tabController;
  HomeController homeController = Get.find();
  bool _isSettings = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _isSettings = homeController.homeType.value == HomeType.settings;
    if (!_isSettings)
      _tabController.index = getPageIndexFromHomeType(homeController.homeType.value);
    else
     Get.to(HomeSettings());
    _tabController.addListener(() {
      homeController.updateItem(getHomeTypeFromPageIndex(_tabController.index));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Groupidy",
            style: kBodyLarge.copyWith(
              color: kWhite,
            )),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        actions: [CustomIconButton(icon: Icons.search_rounded)],
        leading: CustomIconButton(icon: Icons.settings_rounded),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3,
          indicatorColor: kWhite,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: kBodyRegular,
          labelColor: kWhite,
          unselectedLabelColor: kWhiteSecondary,
          tabs: [
            Tab(
              text: "Groups",
            ),
            Tab(
              text: "Chatidy",
            ),
            Tab(
              text: "Profile",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          HomeGroups(),
          HomeChatidyMobile(
            chats: dChats,
          ),
          HomeProfileMobile(user: dUser1),
        ],
      ),
    );
  }
}
