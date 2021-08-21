import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum HomeItems { groups, chatidy, settings, profile }

class HomeController extends GetxController {
  var homeItems = Rx<HomeItems>(HomeItems.chatidy);

  void updateItem(HomeItems item) {
    homeItems.value = item;
    homeItems.refresh();
    //this.update();
  }
}
