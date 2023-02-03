import 'package:flutter/material.dart';
import 'package:siabang_driver_app/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.title, required this.hintText});

  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: primaryTextStyle.copyWith(
            fontSize: 12,
            fontWeight: light,
            color: spaceCadet.withOpacity(0.4),
          ),
        ),
        SizedBox(
          height: 9,
        ),
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: aliceBlue,
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: TextFormField(
              style: primaryTextStyle.copyWith(
                color: spaceCadet,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: primaryTextStyle.copyWith(
                  color: Color(0xff031863).withOpacity(0.2),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
