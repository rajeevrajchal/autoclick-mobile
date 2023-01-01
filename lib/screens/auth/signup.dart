import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile/screens/auth/controller/auth.controller.dart';

import 'package:mobile/theme/vars.dart';
import 'package:mobile/widgets/input.widget.dart';
import 'package:mobile/widgets/passwordinput.widget.dart';

import '../../theme/color.dart';

const title = "Sign up";
const loginDetail =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy";

const google = "assets/icons/google.svg";
const facebook = "assets/icons/facebook.svg";

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.secondary,
        appBar: _appBar(context),
        body: Column(children: [
          Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_title(), _loginDetail()],
              )),
          const SizedBox(
            height: Vars.lg,
          ),
          _registerComponent(context),
        ]));
  }
}

PreferredSizeWidget _appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () => Navigator.of(context).pop(),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black, //change your color here
    ),
    elevation: 0,
    title: const Text(
      'signup',
      style: TextStyle(fontFamily: "WorkSans", color: Colors.black87),
    ),
  );
}

Widget _title() {
  return const Text(
    title,
    style: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'WorkSans'),
  );
}

Widget _loginDetail() {
  return Container(
      margin: const EdgeInsets.only(top: Vars.sm + Vars.xs),
      child: const Text(
        loginDetail,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 16,
          letterSpacing: 1.2,
          fontFamily: 'WorkSans',
          fontWeight: FontWeight.w400,
          color: Palette.defaultText,
        ),
      ));
}

Widget _registerComponent(BuildContext context) {
  return Expanded(
      child: Container(
    alignment: Alignment.topLeft,
    width: double.infinity,
    padding: const EdgeInsets.only(
        top: Vars.lg + Vars.sm, left: Vars.lg, right: Vars.lg),
    decoration: const BoxDecoration(
        color: Palette.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Vars.lg),
          topRight: Radius.circular(Vars.lg),
        )),
    child: Container(
        child: Column(
      children: [
        _registerForm(context),
        const SizedBox(
          height: Vars.lg,
        ),
        const Center(
          child: Text('-- OR --'),
        ),
        const SizedBox(
          height: Vars.lg,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(Vars.sm + Vars.xs),
                  decoration: BoxDecoration(
                      color: Palette.defaultButton,
                      borderRadius: BorderRadius.circular(Vars.md)),
                  child: SvgPicture.asset(google),
                ),
              ),
              const SizedBox(
                width: Vars.lg,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(Vars.sm + Vars.xs),
                  decoration: BoxDecoration(
                      color: Palette.defaultButton,
                      borderRadius: BorderRadius.circular(Vars.md)),
                  child: SvgPicture.asset(facebook),
                ),
              )
            ],
          ),
        )
      ],
    )),
  ));
}

Widget _registerForm(BuildContext context) {
  final AuthController registerController = Get.put(AuthController());

  return Column(
    children: [
      Input(
          placeholder: "Name",
          icon: const Icon(Icons.account_circle),
          textController: registerController.nameController),
      const SizedBox(
        height: Vars.lg,
      ),
      Input(
          placeholder: "Email",
          icon: const Icon(Icons.email),
          textController: registerController.emailController),
      const SizedBox(
        height: Vars.lg,
      ),
      PasswordInput(textController: registerController.passwordController),
      const SizedBox(
        height: Vars.lg,
      ),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Palette.primaryButton,
              minimumSize: const Size.fromHeight(50),
              padding: const EdgeInsets.symmetric(
                vertical: Vars.md,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Vars.md))),
          onPressed: () {
            registerController.signUp();
          },
          child: const Text("Create Account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'WorkSans',
              )))
    ],
  );
}
