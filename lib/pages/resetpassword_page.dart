import 'package:flutter/material.dart';
import 'package:siabang_driver_app/theme.dart';
import 'package:siabang_driver_app/widgets/customTextForm.dart';
import 'package:siabang_driver_app/widgets/custom_button.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 90),
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/resetlogo.png',
              ),
            ),
          ),
        ),
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          top: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reset Password',
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 32,
                color: spaceCadet,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Silahkan masukkan email/whatsapp akun anda',
              style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
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
              logo(),
              title(),
              SizedBox(
                height: 80,
              ),
              CustomTextField(
                title: 'Email / No. whatsapp',
                hintText: 'Email / whatsapp',
              ),
              SizedBox(
                height: 200,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/verifresetpasswordPage',
                  );
                },
                child: CustomButton(
                  margin: EdgeInsets.only(),
                  title: 'Kirim',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
