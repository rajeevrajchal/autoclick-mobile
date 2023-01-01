import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:mobile/screens/auth/controller/auth.controller.dart';
import 'package:mobile/theme/color.dart';
import 'package:mobile/theme/vars.dart';
import 'package:mobile/widgets/input.widget.dart';
import 'package:mobile/widgets/passwordinput.widget.dart';

const title = "Login";
const loginDetail =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy";
const google = "assets/icons/google.svg";
const facebook = "assets/icons/facebook.svg";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          _loginProcess(context)
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
      'login',
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

Widget _loginProcess(BuildContext context) {
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
    child: _loginComponent(context),
  ));
}

Widget _loginComponent(BuildContext context) {
  return Container(
    child: Column(
      children: [
        _loginForm(),
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
    ),
  );
}

Widget _loginForm() {
  AuthController loginController = Get.put(AuthController());

  return Column(
    children: [
      Input(
          placeholder: "Email",
          textController: loginController.emailController,
          icon: const Icon(Icons.mail)),
      const SizedBox(
        height: Vars.lg,
      ),
      PasswordInput(
        textController: loginController.passwordController,
      ),
      const SizedBox(
        height: Vars.lg,
      ),
      SizedBox(
        width: double.infinity,
        child: InkWell(
          onTap: () {},
          child: const Text("Forget Password ? ",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: "WorkSans"),
              textAlign: TextAlign.right),
        ),
      ),
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
                  borderRadius: BorderRadius.circular(Vars.sm))),
          onPressed: () {
            loginController.login();
          },
          child: const Text("Login into account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'WorkSans',
              )))
    ],
  );
}
