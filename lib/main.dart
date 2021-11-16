import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/controller/user_controller.dart';
import 'package:groupidy/routes/app_pages.dart';
import 'package:groupidy/view/splash_view/splash_layout.dart';
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
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return GetMaterialApp(home: Text("Problem with app"));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Groupidy',
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            onInit: () {
              userController.listenToAuthState();
            },
          );
        }
        return SplashLayout();
      },
    );
  }
}
