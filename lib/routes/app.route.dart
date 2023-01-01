import 'package:get/get.dart';
import 'package:mobile/screens/auth/auth.dart';
import 'package:mobile/screens/auth/login.dart';

import 'package:mobile/screens/home/home.dart';
import 'package:mobile/screens/notification/notification.dart';
import 'package:mobile/screens/auth/signup.dart';
import 'package:mobile/screens/splash.screen.dart';

class AppRoutes {
  static String home = '/';
  static String notifications = '/notifications';

  static String initialRoutes = '/initialRoutes';

  // auth routes
  static String auth = '/auth';
  static String login = '/login';
  static String signup = '/signup';
  static String forget_password = '/forget_password';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoutes,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: home,
      page: () => const Home(),
    ),
    GetPage(
        name: notifications,
        page: () => const NotificationScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: auth,
        page: () => const Auth(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: login,
        page: () => const Login(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: signup,
        page: () => const SignUp(),
        transition: Transition.fade,
        transitionDuration: const Duration(seconds: 1)),
  ];
}
