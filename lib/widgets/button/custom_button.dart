import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
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
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: whiteColor,
          disabledBackgroundColor: const Color(0xffCAC9D1),
          disabledForegroundColor: const Color(0xffCAC9D1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          backgroundColor: bgColor,
        ),
        child: Text(
          title,
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
