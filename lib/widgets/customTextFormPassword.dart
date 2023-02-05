import 'package:flutter/material.dart';
import 'package:siabang_driver_app/theme.dart';

class CustomTextPasswordField extends StatefulWidget {
  CustomTextPasswordField({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(
            16,
          ),
          child: TextFormField(
            style: primaryTextStyle.copyWith(
              color: spaceCadet,
            ),
            controller: widget.controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: aliceBlue,
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
              hintText: '••••••••••',
              hintStyle: primaryTextStyle.copyWith(
                color: spaceCadet,
              ),
            ),
            validator: (password) {
              if (password!.isNotEmpty && password.length > 10) {
                return null;
              } else if (password.isNotEmpty && password.length < 10) {
                return 'Password yang anda masukkan salah';
              } else {
                return 'Silahkan masukkan password anda';
              }
            },
            obscureText: tap ? false : true,
          ),
        ),
      ],
    );
  }
}
