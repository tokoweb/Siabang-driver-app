import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/widgets/button/custom_button.dart';

class VerifResetPasswordPage extends StatelessWidget {
  const VerifResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 104,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verifikasi Akun',
              style: primaryTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semiBold,
                color: spaceCadet,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Masukkan 6 digit kode OTP yang telah dikirimkan\nke email atau nomor whatsapp berikut',
              style: primaryTextStyle.copyWith(
                color: spaceCadet,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'johndoe@gmail.com / +62 812 3456 7890',
              style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.w500,
                color: midnightBlue,
              ),
            ),
          ],
        ),
      );
    }

    Widget formField() {
      return Container(
        margin: EdgeInsets.only(
          top: 60,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Kode berlaku selama',
                  style: primaryTextStyle.copyWith(
                    color: spaceCadet,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '00:59',
                  style: primaryTextStyle.copyWith(
                    color: midnightBlue,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: aliceBlue,
                      borderRadius: BorderRadius.circular(
                        14,
                      ),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: aliceBlue,
                      borderRadius: BorderRadius.circular(
                        14,
                      ),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: aliceBlue,
                      borderRadius: BorderRadius.circular(
                        14,
                      ),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: aliceBlue,
                      borderRadius: BorderRadius.circular(
                        14,
                      ),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: aliceBlue,
                      borderRadius: BorderRadius.circular(
                        14,
                      ),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: aliceBlue,
                      borderRadius: BorderRadius.circular(
                        14,
                      ),
                    ),
                    child: TextField(
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Kode tidak diterima? ',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        color: spaceCadet,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Kirim melalui email',
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: semiBold,
                          color: midnightBlue,
                        ),
                      ),
                    ),
                    Text(
                      ' atau',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        color: spaceCadet,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Kirim ulang kode',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      color: midnightBlue,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              formField(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/createnewpasswordPage');
                },
                child: CustomButton(
                  margin: EdgeInsets.only(top: 290),
                  title: 'Verifikasi',
                  bgColor: midnightBlue,
                  textColor: whiteColor,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
