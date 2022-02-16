import 'package:get/get.dart';
import 'package:chatapp/model/group.dart';
import 'package:chatapp/services/firestore_service.dart';
import 'package:chatapp/view/home_views/home_type.dart';

class HomeController extends GetxController {
  var groups = Rx<List<Group>>([]);

  var currentGroup = "";

  var homeType = Rx<HomeType>(HomeType.groups);

  void updateItem(HomeType item) {
    homeType.value = item;
    homeType.refresh();
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
    // HomeType.chatidy,
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
              //update existing group
              var groupIndex = groups.value.indexWhere((group) => group.gid == groupToAdd.gid);
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

  void joinGroup({required String name, required String tag, required String uid, required Function onNotExists, required Function onSucess, required Function onExists}) async {
    if (groups.value.any((group) => group.name == name && group.tag == tag)) {
      // Group already exists
      onExists();
      return;
    }

    FirestoreService.getGroupByName(name, tag).then((query) {
      //List<Group> gs = [];
      var gs = query.docs.map((doc) {
        return doc.data();
      }).toList();

      if (gs.length == 0) {
        // there is no such group
        onNotExists();
      } else if (gs.length == 1) {
        // Found group
        FirestoreService.joinUserToGroup(uid, gs[0].gid);
        onSucess();
        groups.value.add(gs[0]);
        groups.refresh();
      } else {
        // There are more than 1 group with the same name
      }
    });
  }
}
