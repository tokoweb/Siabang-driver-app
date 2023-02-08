import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siabang_driver_app/constant/theme.dart';

class CustomTextFormWhatsappField extends StatelessWidget {
  const CustomTextFormWhatsappField({
    super.key,
    this.title = '',
    this.hintText = '',
    this.controller,
  });

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
        SizedBox(
          height: 9,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(
            16,
          ),
          child: TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(
                20,
              ),
              FilteringTextInputFormatter.digitsOnly,
            ],
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
              contentPadding: EdgeInsets.only(
                left: 20,
              ),
            ),
            validator: (value) {
              if (value!.isNotEmpty && value.length > 10) {
                return null;
              } else if (value.length < 10 && value.isNotEmpty) {
                return 'Nomor whatsapp belum terdaftar ';
              } else {
                return 'Silahkan masukkan no whatsapp anda';
              }
            },
          ),
        ),
      ],
    );
  }
}
