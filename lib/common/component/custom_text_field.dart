import 'package:flutter/material.dart';
import 'package:todo_list/common/const/color.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final String? initialValue;
  final Function(String)? onFieldSubmitted;
  final Widget? icon;
  final bool obscureText, autoFocusText, enabled;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    this.hintText,
    this.errorText,
    this.icon,
    this.initialValue,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.enabled = true,
    this.autoFocusText = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const baseBorder = OutlineInputBorder(
        borderSide: BorderSide(
      color: Colors.white,
    ));

    return TextFormField(
      enabled: enabled,
      cursorColor: Colors.blue,
      obscureText: obscureText,
      autofocus: autoFocusText,
      onFieldSubmitted: onFieldSubmitted,
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        prefixIcon: icon,
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            // color: Colors.blue,
          ),
        ),
        errorText: errorText,
        hintStyle: const TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
