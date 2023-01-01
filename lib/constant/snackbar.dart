import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarType {
  static successSnack(String title, String message) {
    return Get.snackbar(title, message, backgroundColor: Colors.greenAccent);
  }

  static errorSnack(String title, String message) {
    return Get.snackbar(title, message,
        backgroundColor: const Color.fromARGB(255, 250, 113, 113));
  }

  static warningSnack(String title, String message) {
    return Get.snackbar(title, message,
        backgroundColor: const Color.fromARGB(255, 247, 195, 127));
  }
}
