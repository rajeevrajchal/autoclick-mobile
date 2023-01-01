import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/constant/snackbar.dart';
import 'package:mobile/constant/supabase.dart';
import 'package:mobile/routes/app.route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const emailRedirect = 'io.supabase.flutterquickstart://login-callback/';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  resetForm() {
    emailController.text = "";
    passwordController.text = "";
    nameController.text = "";
  }

  Future<void> login() async {
    try {
      await supabase.auth.signInWithPassword(
          email: emailController.text, password: passwordController.text);
      resetForm();
    } on AuthException catch (error) {
      // ignore: prefer_interpolation_to_compose_strings
      SnackbarType.errorSnack("Auth", "Login failed: " + error.message);
    } catch (error) {
      SnackbarType.errorSnack("Auth", "Login failed: ");
    }
  }

  Future<void> signUp() async {
    debugPrint(passwordController.text);
    debugPrint(emailController.text);
    debugPrint(nameController.text);
    try {
      var res = await supabase.auth.signUp(
          email: emailController.text,
          password: passwordController.text,
          emailRedirectTo: emailRedirect);
      print(res);
      resetForm();
    } on AuthException catch (error) {
      // ignore: prefer_interpolation_to_compose_strings
      SnackbarType.errorSnack("Auth", error.message);
    } catch (error) {
      SnackbarType.errorSnack("Auth", "Register failed: ");
    }
  }

  Future<void> checkAuthentication() async {
    try {
      final session = supabase.auth.currentSession;
      if (session != null) {
        Get.toNamed(AppRoutes.home);
      } else {
        Get.toNamed(AppRoutes.login);
      }
    } catch (error) {
      SnackbarType.errorSnack("Auth", "Sign up failed: ");
      Get.toNamed(AppRoutes.login);
    }
  }
}
