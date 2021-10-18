part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const GROUP = _Paths.GROUP;
  static const SPLASH = _Paths.SPLASH;
  static const JOIN = _Paths.JOIN;
  static const LOGIN = _Paths.LOGIN;
  static const WELCOME = _Paths.WELCOME;
}

abstract class _Paths {
  static const HOME = "/home";
  static const GROUP = "/group";
  static const SPLASH = "/splash";
  static const JOIN = "/join";
  static const LOGIN = "/login";
  static const WELCOME = "/";
}
