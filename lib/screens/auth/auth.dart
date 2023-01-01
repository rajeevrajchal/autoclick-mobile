import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/routes/app.route.dart';
import 'package:mobile/theme/color.dart';
import 'package:mobile/theme/vars.dart';

const logo = 'assets/images/logo/logo-no-background.png';
const welcome = "Welcome,";
const welcomeDetail =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries";

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Palette.secondary,
        width: double.infinity,
        height: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_logo(), _detail()]),
      ),
    );
  }
}

Widget _logo() {
  return Container(
    height: 300,
    width: 300,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    child: const Center(
        child: Image(
      image: AssetImage(logo),
      fit: BoxFit.contain,
    )),
  );
}

Widget _detail() {
  return Expanded(
      child: Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: const BoxDecoration(
        color: Palette.light,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _welcomeBanner(),
            _about(),
            _rowButtons(),
          ],
        ),
      ),
    ),
  ));
}

Widget _welcomeBanner() {
  return const Text(
    welcome,
    style: TextStyle(
        color: Palette.primaryDark,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily: 'WorkSans'),
  );
}

Widget _about() {
  return const Text(
    welcomeDetail,
    textAlign: TextAlign.justify,
    style: TextStyle(
      fontSize: Font.md,
      fontWeight: FontWeight.w400,
      color: Palette.defaultText,
      letterSpacing: 1.2,
      fontFamily: 'WorkSans',
    ),
  );
}

Widget _rowButtons() {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                fixedSize: const Size(152, 50),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            onPressed: () {
              Get.toNamed(AppRoutes.login);
            },
            child: const Text("Sign In",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'WorkSans',
                ))),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: const Size(152, 50),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            onPressed: () {
              Get.toNamed(AppRoutes.signup);
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.bold),
            ))
      ]);
}
