import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/controller/home_controller.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/home_views/home_type.dart';

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
          Expanded(
            child: ListView.builder(
              itemCount: homeController.menuItems.length,
              itemBuilder: (buildContext, index) {
                HomeType currentHomeType = homeController.menuItems[index];
                return Obx(() => MenuItem(
                    selected: homeController.homeType.value == currentHomeType,
                    text: homeController.getTitle(currentHomeType),
                    onTap: () => {homeController.updateItem(currentHomeType)}));
              },
            ),
          ),
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
  final bool selected;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(
            color: selected ? kWhite : Colors.white.withOpacity(0),
            width: 3,
          ))),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 16),
                child: SvgPicture.asset(
                  "assets/chatidy.svg",
                  semanticsLabel: 'chatidy',
                  width: 32,
                  height: 32,
                  color: selected ? kWhite : kWhiteSecondary,
                ),
              ),
              Container(
                child: Text(
                  text,
                  textAlign: TextAlign.start,
                  style: kBodyLarge.copyWith(
                    color: selected ? kWhite : kWhiteSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
