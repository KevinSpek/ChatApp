import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/view/home_views/home_type.dart';



class HomeController extends GetxController {
  var homeType = Rx<HomeType>(HomeType.chatidy);

  void updateItem(HomeType item) {
    homeType.value = item;
    homeType.refresh();
    //this.update();
  }
}
