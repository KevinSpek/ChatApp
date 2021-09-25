import 'package:get/get.dart';
import 'package:groupidy/view/home_views/home_type.dart';



class HomeController extends GetxController {
  var homeType = Rx<HomeType>(HomeType.chatidy);

  void updateItem(HomeType item) {
    homeType.value = item;
    homeType.refresh();
    //this.update();
  }

  String getTitle(HomeType item) {
    switch (item) {
      case HomeType.chatidy : return "Chatidy";
      case HomeType.groups : return "Groups";
      case HomeType.profile : return "Profile";
      case HomeType.settings : return "Settings";
    }
  }

  final List menuItems = [HomeType.chatidy, HomeType.groups, HomeType.profile, HomeType.settings];
}
