import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/images.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/auth/createnewpassword_page.dart';
import 'package:siabang_driver_app/pages/auth/verifresetpassword_page.dart';
import 'package:siabang_driver_app/widgets/button/custom_button.dart';
import 'package:siabang_driver_app/widgets/customTextField/customTextResetForm.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool isButtonActive = false;
  late TextEditingController controllerForm;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controllerForm = TextEditingController();
    controllerForm.addListener(() {
      final isButtonActive = controllerForm.text.isNotEmpty;

      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controllerForm.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return Center(
        child: Container(
          margin: const EdgeInsets.only(top: 90),
          width: 180,
          height: 180,
          decoration: const BoxDecoration(
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
        margin: const EdgeInsets.only(
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
            const SizedBox(
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
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              logo(),
              title(),
              const SizedBox(
                height: 80,
              ),
              Form(
                key: _formKey,
                child: CustomResetFormField(
                  title: 'Email / No. whatsapp',
                  hintText: 'Email / whatsapp',
                  controller: controllerForm,
                ),
              ),
              const SizedBox(
                height: 190,
              ),
              GestureDetector(
                onTap: () {
                  nextScreen(const VerifResetPasswordPage());
                },
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    margin: const EdgeInsets.only(),
                    title: 'Kirim',
                    bgColor: isButtonActive == true
                        ? midnightBlue
                        : const Color(0xffCAC9D1),
                    textColor: isButtonActive == true
                        ? whiteColor
                        : blackColor.withOpacity(0.5),
                    onPressed: isButtonActive
                        ? () {
                            if (_formKey.currentState!.validate()) {
                              return nextScreenReplace(
                                  const CreateNewPasswordPage());
                            }
                            setState(() {
                              isButtonActive = true;
                            });
                          }
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
