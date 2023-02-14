import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/images.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/auth/resetpassword_page.dart';
import 'package:siabang_driver_app/pages/auth/verifloginemail_page.dart';
import 'package:siabang_driver_app/pages/auth/whatsapplogin_page.dart';
import 'package:siabang_driver_app/widgets/button/custom_button.dart';

import '../../widgets/customTextField/customTextForm.dart';
import '../../widgets/customTextField/customTextFormPassword.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isButtonActive = false;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPassword;
  final _formKey = GlobalKey<FormState>();
  final _formKeyPw = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();
    controllerEmail.addListener(() {
      final isButtonActive = controllerEmail.text.isNotEmpty;

      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
    controllerPassword.addListener(() {
      final isButtonActive = controllerPassword.text.isNotEmpty;

      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 104),
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
            const SizedBox(
              height: 10,
            ),
            Text(
              'Silahkan masukkan email',
              style: primaryTextStyle,
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                width: 150,
                height: 150,
                child: Image.asset(
                  logoSiabang,
                ),
              ),
            ),
            const SizedBox(height: 55),
            Form(
              key: _formKey,
              child: CustomTextField(
                controller: controllerEmail,
                title: 'Email',
                hintText: 'johndoe@gmail.com',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKeyPw,
              child: CustomTextPasswordField(
                controller: controllerPassword,
              ),
            ),
          ],
        ),
      );
    }

    Widget textButton() {
      return Container(
        margin: const EdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: TextButton(
                onPressed: () {
                  nextScreen(
                    const ResetPasswordPage(),
                  );
                },
                child: Text(
                  'Lupa Password',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                    color: const Color(0xff031863),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: TextButton(
                onPressed: () {
                  nextScreen(const WhatsappLoginPage());
                },
                child: Text(
                  'Login dengan no whatsapp & OTP',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    color: const Color(0xff031863),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget button() {
      return SizedBox(
        width: double.infinity,
        child: CustomButton(
          margin: const EdgeInsets.only(top: 60),
          title: 'Login',
          bgColor:
              isButtonActive == true ? midnightBlue : const Color(0xffCAC9D1),
          textColor:
              isButtonActive == true ? whiteColor : blackColor.withOpacity(0.5),
          onPressed: isButtonActive
              ? () {
                  if (_formKey.currentState!.validate() &&
                      _formKeyPw.currentState!.validate()) {
                    return nextScreenReplace(
                      const VerifLoginEmailPage(),
                    );
                  }
                  setState(() {
                    isButtonActive = true;
                  });
                }
              : null,
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        reverse: true,
        physics: const BouncingScrollPhysics(),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Container(
            margin: const EdgeInsets.symmetric(
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
      ),
    );
  }
}
