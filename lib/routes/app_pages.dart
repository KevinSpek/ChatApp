import 'package:get/get.dart';
import 'package:groupidy/routes/logged_middleware.dart';
import 'package:groupidy/routes/not_logged_middleware.dart';
import 'package:groupidy/view/auth_views/join/join_layout.dart';
import 'package:groupidy/view/auth_views/login/login_layout.dart';
import 'package:groupidy/view/group_view/group_layout.dart';
import 'package:groupidy/view/home_views/home_layout.dart';
import 'package:groupidy/view/splash_view/splash_layout.dart';
import 'package:groupidy/view/welcome_view/welcome_layout.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH;
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeLayout(),
      middlewares: [NotLoggedMiddleware()],
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.GROUP,
      page: () => GroupLayout(),
      middlewares: [NotLoggedMiddleware()],
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashLayout(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeLayout(),
      middlewares: [LoggedMiddleware()],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginLayout(),
      middlewares: [LoggedMiddleware()],
    ),
  ];
}
