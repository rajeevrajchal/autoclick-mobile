import 'package:flutter/material.dart';
import 'package:mobile/theme/vars.dart';

class Input extends StatelessWidget {
  final String placeholder;
  final Widget icon;
  final TextEditingController? textController;

  const Input(
      {super.key,
      required this.placeholder,
      required this.icon,
      this.textController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        prefixIcon: icon,
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(Vars.md)),
        hintText: placeholder,
        contentPadding: const EdgeInsets.all(Vars.md),
        hintStyle: const TextStyle(
          fontFamily: "WorkSans-Regular",
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
