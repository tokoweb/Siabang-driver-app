import 'package:flutter/material.dart';
import 'package:siabang_driver_app/theme.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.margin,
    required this.title,
    required this.textColor,
    required this.bgColor,
    required this.onPressed,
  });

  final Color textColor;
  final Color bgColor;
  final EdgeInsets margin;
  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            color: textColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: whiteColor,
          disabledBackgroundColor: Color(0xffCAC9D1),
          disabledForegroundColor: Color(0xffCAC9D1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          backgroundColor: bgColor,
        ),
      ),
    );
  }
}
