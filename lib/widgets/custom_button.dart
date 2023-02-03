import 'package:flutter/material.dart';
import 'package:siabang_driver_app/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.margin,
    required this.title,
  });

  final EdgeInsets margin;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: midnightBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          title,
          style: primaryTextStyle.copyWith(
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
