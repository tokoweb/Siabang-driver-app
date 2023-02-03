import 'package:flutter/material.dart';
import 'package:siabang_driver_app/theme.dart';
import 'package:siabang_driver_app/widgets/customTextForm.dart';
import 'package:siabang_driver_app/widgets/customTextFormPassword.dart';
import 'package:siabang_driver_app/widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 104),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: primaryTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Silahkan masukkan email',
              style: primaryTextStyle,
            ),
            SizedBox(height: 125),
            CustomTextField(
              title: 'Email / No. whatsapp',
              hintText: 'Email / whatsapp',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextPasswordField(),
          ],
        ),
      );
    }

    Widget textButton() {
      return Container(
        margin: EdgeInsets.only(
          top: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/resetPage',
                  );
                },
                child: Text(
                  'Lupa Password',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                    color: Color(0xff031863),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/whatsappPage');
                },
                child: Text(
                  'Login dengan no whatsapp & OTP',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    color: Color(0xff031863),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget button() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/verifloginemailPage',
          );
        },
        child: CustomButton(
          margin: EdgeInsets.only(top: 90),
          title: 'Login',
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
            children: [
              header(),
              textButton(),
              button(),
            ],
          ),
        ),
      ),
    );
  }
}
