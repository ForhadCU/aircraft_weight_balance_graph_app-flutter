import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  const CustomText(
      {Key? key,
      required this.text,
      this.textColor,
      this.fontWeight,
      this.fontSize,
      this.textDecoration, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: textColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
          decoration: textDecoration),
    );
  }
}
