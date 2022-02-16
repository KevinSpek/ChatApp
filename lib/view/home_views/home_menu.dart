import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:chatapp/colors.dart';
import 'package:chatapp/controller/home_controller.dart';
import 'package:chatapp/typography.dart';
import 'package:chatapp/view/home_views/home_type.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    bool hideNavText = context.width < 1200;
    return Container(
      color: kPrimaryColor,
      width: hideNavText ? 70 : 200,
      child: Column(
        children: [
          Visibility(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "BondBox",
                    style: kSubTitle.copyWith(color: kWhite),
                  ),
                ),
                Spacer()
              ],
            ),
            visible: !hideNavText,
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: homeController.menuItems.length,
              itemBuilder: (buildContext, index) {
                HomeType currentHomeType = homeController.menuItems[index];
                return Obx(() => MenuItem(noText: hideNavText, selected: homeController.homeType.value == currentHomeType, text: homeController.getTitle(currentHomeType), imagePath: homeController.getImagePath(currentHomeType), onTap: () => {homeController.updateItem(currentHomeType)}));
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
    required this.imagePath,
    required this.onTap,
    this.noText = false,
  }) : super(key: key);

  final bool selected;
  final String text;
  final String imagePath;
  final VoidCallback onTap;
  final bool noText;

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
            color: selected ? kWhite : Colors.transparent,
            width: 3,
          ))),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: SvgPicture.asset(
                  imagePath,
                  semanticsLabel: text,
                  width: 32,
                  height: 32,
                  color: selected ? kWhite : kWhiteSecondary,
                ),
              ),
              Visibility(
                child: Container(
                  child: Text(
                    text,
                    textAlign: TextAlign.start,
                    style: kBodyLarge.copyWith(
                      color: selected ? kWhite : kWhiteSecondary,
                    ),
                  ),
                ),
                visible: !noText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
