part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const GROUP = _Paths.GROUP;
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const WELCOME = _Paths.WELCOME;
  static const NEWUSER = _Paths.NEWUSER;
}

abstract class _Paths {
  static const HOME = "/home";
  static const GROUP = "/group";
  static const SPLASH = "/splash";
  static const LOGIN = "/login";
  static const WELCOME = "/";
  static const NEWUSER = "/newuser";
}
