import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';

class TTInput extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String labelText;
  final String hintText;
  final void Function()? onTap;
  final bool readOnly;
  final TextAlign textAlign;

  const TTInput(
      {Key? key,
      required this.controller,
      required this.validator,
      this.labelText = "",
      this.hintText = "",
      this.onTap,
      this.readOnly = false,
      this.textAlign = TextAlign.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autocorrect: false,
      validator: validator,
      cursorColor: TTColors.primary,
      style: const TextStyle(color: TTColors.primary, fontSize: 16),
      onTap: onTap,
      readOnly: readOnly,
      textAlign: textAlign,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: TTColors.primary),
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(TTBorderRadius.small),
            borderSide: const BorderSide(color: TTColors.primary)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(TTBorderRadius.small),
            borderSide: const BorderSide(color: TTColors.primary)),
      ),
    );
  }
}
