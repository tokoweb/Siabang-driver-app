import 'package:flutter/material.dart';
import 'package:siabang_driver_app/theme.dart';

class CustomTextPasswordField extends StatefulWidget {
  const CustomTextPasswordField({
    super.key,
  });

  @override
  State<CustomTextPasswordField> createState() =>
      _CustomTextPasswordFieldState();
}

class _CustomTextPasswordFieldState extends State<CustomTextPasswordField> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  bool tap = false;

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
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
            child: TextField(
              style: primaryTextStyle.copyWith(
                color: spaceCadet,
              ),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        tap = !tap;
                      },
                    );
                  },
                  icon: Icon(
                    tap
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  color: spaceCadet,
                ),
                border: InputBorder.none,
                hintText: 'Password',
                hintStyle: primaryTextStyle.copyWith(
                  color: Color(0xff031863).withOpacity(0.2),
                ),
              ),
              obscureText: tap ? false : true,
            ),
          ),
        ),
      ],
    );
  }
}
