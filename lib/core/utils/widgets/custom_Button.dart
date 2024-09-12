import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  const customButton(
      {super.key,
      required this.text,
      required this.textColor,
      required this.backgroundColor,
      this.borderRadius,
      this.fontSize,
      this.onPressed});

  final String text;
  final Color textColor;
  final Color backgroundColor;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style:
              Styles.textStyle18.copyWith(color: textColor, fontSize: fontSize),
        ),
      ),
    );
  }
}
