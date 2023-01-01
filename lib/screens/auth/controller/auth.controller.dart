import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/constant/snackbar.dart';
import 'package:mobile/constant/supabase.dart';
import 'package:mobile/routes/app.route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  Future<void> userLogin() async {
    try {
      await supabase.auth.signInWithPassword(
          email: emailController.text, password: passwordController.text);
    } on AuthException catch (error) {
      // ignore: prefer_interpolation_to_compose_strings
      SnackbarType.errorSnack("Auth", "Login failed: " + error.message);
    } catch (error) {
      SnackbarType.errorSnack("Auth", "Login failed: ");
    }
  }

  Future<void> signUp() async {
    try {
      await supabase.auth.signUp(
          email: emailController.text, password: passwordController.text);
    } catch (error) {
      SnackbarType.errorSnack("Auth", "Sign up failed: ");
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
