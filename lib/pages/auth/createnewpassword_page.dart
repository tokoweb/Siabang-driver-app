import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/images.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/auth/login_page.dart';
import 'package:siabang_driver_app/widgets/button/custom_button.dart';

import '../../widgets/customTextField/customconfirmnewpw.dart';
import '../../widgets/customTextField/customnewpw.dart';

class CreateNewPasswordPage extends StatelessWidget {
  const CreateNewPasswordPage({super.key});

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
                resetLogo,
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
              'Create\nnew password',
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
              'Silahkan buat password baru anda',
              style: primaryTextStyle.copyWith(
                color: spaceCadet,
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
                height: 40,
              ),
              CustomNewPasswordField(),
              SizedBox(
                height: 20,
              ),
              CustomConfirmNewPasswordField(),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                margin: EdgeInsets.only(top: 105),
                title: 'Kirim',
                bgColor: midnightBlue,
                textColor: whiteColor,
                onPressed: () {
                  nextScreenReplace(LoginPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
