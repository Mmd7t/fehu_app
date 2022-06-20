import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final double? width;
  final double? height;
  final Color? color;
  const GlobalButton(
      {Key? key,
      this.color,
      required this.onPressed,
      this.text,
      this.width,
      this.height = 55})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text!),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: color ?? Get.theme.primaryColor,
      textColor: Colors.white,
      elevation: 0.0,
      minWidth: width ?? Get.width * 0.85,
      height: height,
    );
  }
}
