import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/dummy_data.dart';
import 'package:groupidy/model/channels/channel_type.dart';
import 'package:groupidy/utils.dart';
import 'package:groupidy/view/auth_views/join/join_layout.dart';
import 'package:groupidy/view/auth_views/login/login_layout.dart';
import 'package:groupidy/view/components/post_bubble.dart';
import 'package:groupidy/view/components/general_dialog.dart';
import 'package:groupidy/view/components/post_bubble.dart';
import 'package:groupidy/view/components/textfield_bar.dart';
import 'package:groupidy/view/group_view/group_layout.dart';
import 'package:groupidy/view/home_views/home_layout.dart';
import 'package:groupidy/view/splash_view/splash_layout.dart';
import 'package:groupidy/view/welcome_view/welcome_layout.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return MaterialApp(home: Text("Problem with app"));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Groupidy',
            initialRoute: '/home',
            routes: {
              '/': (context) => WelcomeLayout(),
              '/join': (context) => JoinLayout(),
              '/login': (context) => LoginLayout(),
              '/splash': (context) => SplashLayout(),
              '/home': (context) => HomeLayout(),
              '/group': (context) => GroupLayout(),
              '/test': (context) => WelcomeLayout(),
            },
          );
        }

        return SplashLayout();
      },
    );
  }
}
