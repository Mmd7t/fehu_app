import 'package:flutter/material.dart';
import '../core/utils/extensions.dart';

class CustomAuthTextField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final bool obsecure;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const CustomAuthTextField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.onSuffixTap,
    this.suffixIcon,
    this.obsecure = false,
    this.inputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onSaved,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecure,
      keyboardType: inputType,
      textInputAction: textInputAction,
      onSaved: onSaved,
      validator: validator,
      decoration: CustomInputDecoration.decorate(
        hintText: hintText,
        prefixIcon: prefixIcon,
        onSuffixTap: onSuffixTap,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
