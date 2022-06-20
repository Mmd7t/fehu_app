import 'package:fehu_app/app/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalTextField extends StatelessWidget {
  final String? hint;
  final String? value;
  final IconData? prefixIcon;
  final int? maxLines;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final TextDirection? direction;
  final TextAlign? alignment;
  final FocusNode? focusNode;
  const GlobalTextField({
    Key? key,
    this.hint,
    this.focusNode,
    this.prefixIcon,
    this.value,
    this.maxLines,
    this.controller,
    @required this.validator,
    @required this.onSaved,
    this.direction,
    this.alignment,
    @required this.textInputAction,
    @required this.keyboardType,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      textDirection: direction,
      textAlign: alignment ?? TextAlign.start,
      maxLines: maxLines ?? 1,
      style: Get.textTheme.bodyText2!.copyWith(
        color: Get.isDarkMode ? Colors.white : Colors.black,
      ),
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      onChanged: onChanged!,
      validator: validator!,
      onSaved: onSaved!,
      decoration: CustomInputDecoration.decorate(
        hintText: hint!,
        prefixIcon: prefixIcon!,
      ),
    );
  }
}
