import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:groupidy/model/group.dart';
import 'package:groupidy/services/firestore_service.dart';
import 'package:groupidy/view/home_views/home_type.dart';

class HomeController extends GetxController {
  var groups = Rx<List<Group>>([]);

  var currentGroup = "";

  var homeType = Rx<HomeType>(HomeType.chatidy);

  void updateItem(HomeType item) {
    homeType.value = item;
    homeType.refresh();
    //this.update();
  }

  String getTitle(HomeType item) {
    switch (item) {
      case HomeType.chatidy:
        return "Chatidy";
      case HomeType.groups:
        return "Groups";
      case HomeType.profile:
        return "Profile";
      case HomeType.settings:
        return "Settings";
    }
  }

  String getImagePath(HomeType item) {
    switch (item) {
      case HomeType.chatidy:
        return "chatidy.svg";
      case HomeType.groups:
        return "group.svg";
      case HomeType.profile:
        return "user.svg";
      case HomeType.settings:
        return "settings.svg";
    }
  }

  final List menuItems = [
    HomeType.chatidy,
    HomeType.groups,
    HomeType.profile,
    HomeType.settings
  ];

  void loadGroups(List<String> gids) {
    if (gids.length == 0) {
      return;
    }

    FirestoreService.getGroups(gids).then((query) => {
          query.docs.forEach((doc) {
            var groupToAdd = doc.data();
            if (!groups.value.any((group) => group.gid == groupToAdd.gid)) {
              groups.value.add(groupToAdd);
            } else {
              //update existing channel
              var groupIndex = groups.value
                  .indexWhere((group) => group.gid == groupToAdd.gid);
              groups.value[groupIndex] = groupToAdd;
            }
            groups.refresh();
          })
        });
  }

  void navigateToGroup(String gid) {
    this.currentGroup = gid;
    Get.toNamed('/group');
  }
}
