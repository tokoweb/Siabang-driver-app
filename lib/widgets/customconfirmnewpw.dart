import 'package:flutter/material.dart';
import 'package:siabang_driver_app/theme.dart';

class CustomConfirmNewPasswordField extends StatefulWidget {
  const CustomConfirmNewPasswordField({
    super.key,
  });

  @override
  State<CustomConfirmNewPasswordField> createState() =>
      _CustomConfirmNewPasswordFieldState();
}

class _CustomConfirmNewPasswordFieldState
    extends State<CustomConfirmNewPasswordField> {
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
          'Ketik ulang passsword baru',
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
                hintText: 'Password Baru',
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
