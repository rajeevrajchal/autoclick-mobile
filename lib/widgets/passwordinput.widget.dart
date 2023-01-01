import 'package:flutter/material.dart';
import 'package:mobile/theme/vars.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController? textController;
  const PasswordInput({super.key, this.textController});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      obscureText: _obscureText,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: !_obscureText
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          onPressed: () {
            _toggle();
          },
        ),
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(Vars.md)),
        hintText: "Password",
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
