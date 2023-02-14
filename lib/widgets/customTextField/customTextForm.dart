// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.title = '',
    this.hintText = '',
    this.maxLines = 1,
    this.controller,
  });

  final int maxLines;
  final String title;
  final String hintText;
  final TextEditingController? controller;

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
        const SizedBox(
          height: 9,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(
            16,
          ),
          child: TextFormField(
            maxLines: maxLines,
            controller: controller,
            style: primaryTextStyle.copyWith(
              color: spaceCadet,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: aliceBlue,
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  16,
                ),
                borderSide: BorderSide(
                  width: 2,
                  color: crimsonColor,
                ),
              ),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: primaryTextStyle.copyWith(
                color: spaceCadet,
              ),
              contentPadding: const EdgeInsets.only(
                left: 20,
                top: 10,
                bottom: 10,
              ),
            ),
            validator: (value) {
              if (value!.isNotEmpty &&
                  value.length > 12 &&
                  value.contains('@')) {
                return null;
              } else if (value.length < 13 && value.isNotEmpty) {
                return 'Email yang anda masukkan salah';
              } else {
                return 'Silahkan masukkan email anda';
              }
            },
          ),
        ),
      ],
    );
  }
}
