import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChanged,
      this.validator,
      this.obscureText,
      this.icon});

  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide(color: colors.secondary));

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          suffixIcon: Icon(icon),
          enabledBorder: border,
          focusedBorder:
              border.copyWith(borderSide: BorderSide(color: colors.primary)),
          label: label != null ? Text(label!) : null,
          hintText: hint,
          isDense: true,
          errorText: errorMessage,
          errorStyle: TextStyle(color: Colors.red.shade400),
          errorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade400)),
          focusedErrorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade400)),
          focusColor: colors.primary),
    );
  }
}
