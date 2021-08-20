import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/controller/home_controller.dart';
import 'package:groupidy/typography.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Groupidy",
                  textAlign: TextAlign.start,
                  style: kSubTitle.copyWith(color: Colors.white),
                ),
              ),
              Spacer()
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Obx(
            () => MenuItem(
              selected: homeController.homeItems == Rx<HomeItems>(HomeItems.chatidy),
              text: "Chatidy",
              onTap: () => {homeController.updateItem(HomeItems.chatidy)},
            ),
          ),
          Obx(
            () => MenuItem(
              selected: homeController.homeItems == Rx<HomeItems>(HomeItems.groups),
              text: "Groups",
              onTap: () => {
                homeController.updateItem(HomeItems.groups) //homeItems = Rx<HomeItems>(;
              },
            ),
          ),
          Obx(
            () => MenuItem(
              selected: homeController.homeItems == Rx<HomeItems>(HomeItems.profile),
              text: "Profile",
              onTap: () => {
                homeController.updateItem(HomeItems.profile),
              },
            ),
          ),
          Obx(
            () => MenuItem(
              selected: homeController.homeItems == Rx<HomeItems>(HomeItems.settings),
              text: "Settings",
              onTap: () => {homeController.updateItem(HomeItems.settings)},
            ),
          )
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.selected,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final selected;
  final text;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected ? Colors.white : Colors.white.withOpacity(0.5),
                  ),
                  width: 16,
                  height: 16,
                ),
              ),
              Spacer(),
              Container(
                width: 108,
                child: Text(
                  text,
                  textAlign: TextAlign.start,
                  style: kBodyLarge.copyWith(
                    color: selected ? Colors.white : Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  color: selected ? Colors.white : Colors.white.withOpacity(0),
                  width: 3,
                  height: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
