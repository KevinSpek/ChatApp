import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/utils.dart';
import 'package:groupidy/view/auth_views/join/join_layout.dart';
import 'package:groupidy/view/auth_views/login/login_layout.dart';
import 'package:groupidy/view/components/create_join_group/create_join_group.dart';
import 'package:groupidy/view/components/general_dialog.dart';
import 'package:groupidy/view/components/new_channel/new_channel.dart';
import 'package:groupidy/view/components/post_bubble.dart';
import 'package:groupidy/view/components/general_dialog.dart';
import 'package:groupidy/view/components/post_bubble.dart';
import 'package:groupidy/view/components/textfield_bar.dart';
import 'package:groupidy/view/group_view/group_layout.dart';
import 'package:groupidy/view/home_views/home_layout.dart';
import 'package:groupidy/view/home_views/home_profile.dart';
import 'package:groupidy/view/splash_view/splash_layout.dart';
import 'package:groupidy/view/welcome_view/welcome_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Groupidy',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          dialogBackgroundColor: Colors.transparent),
      initialRoute: '/group',
      routes: {
        '/': (context) => WelcomeLayout(),
        '/join': (context) => JoinLayout(),
        '/login': (context) => LoginLayout(),
        '/splash': (context) => SplashLayout(),
        '/home': (context) => HomeLayout(),
        '/group': (context) => GroupLayout(),
        '/test': (context) => Scaffold(
            backgroundColor: kSecondaryBackground,
            body: Column(
              children: [
                InkWell(
                  child: Text('open dialoge'),
                  onTap: () => {
                    dialog(
                      context: context,
                      child: CreateJoinGroup(),
                    ),
                  },
                ),
                TextFieldBar(
                  onSend: (String s) {
                    print(s);
                  },
                ),
              ],
            )),
      },
    );
  }
}
