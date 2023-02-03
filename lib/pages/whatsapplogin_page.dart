import 'package:flutter/material.dart';
import 'package:siabang_driver_app/theme.dart';
import 'package:siabang_driver_app/widgets/customTextForm.dart';
import 'package:siabang_driver_app/widgets/custom_button.dart';

class WhatsappLoginPage extends StatelessWidget {
  const WhatsappLoginPage({super.key});

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
              'Silahkan masukkan whatsapp',
              style: primaryTextStyle,
            ),
            SizedBox(height: 250),
            CustomTextField(
              title: 'No. whatsapp',
              hintText: 'whatsapp',
            ),
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
            Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Login dengan email & password',
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  color: Color(0xff031863),
                ),
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
            children: [
              header(),
              textButton(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/verifloginPage',
                  );
                },
                child: CustomButton(
                  margin: EdgeInsets.only(top: 90),
                  title: 'Selanjutnya',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
