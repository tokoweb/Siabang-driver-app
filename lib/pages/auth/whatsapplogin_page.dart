import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/images.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/auth/verifloginwhatsapp_page.dart';
import 'package:siabang_driver_app/widgets/button/custom_button.dart';

import '../../widgets/customTextField/customTextFormWhatsapp.dart';

class WhatsappLoginPage extends StatefulWidget {
  const WhatsappLoginPage({super.key});

  @override
  State<WhatsappLoginPage> createState() => _WhatsappLoginPageState();
}

class _WhatsappLoginPageState extends State<WhatsappLoginPage> {
  bool isButtonActive = false;
  late TextEditingController controller;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;

      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
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
              'Silahkan masukkan whatsapp',
              style: primaryTextStyle,
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  logoSiabang,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Form(
              key: _formkey,
              child: CustomTextFormWhatsappField(
                controller: controller,
                title: 'No. whatsapp',
                hintText: '+62 81234567890',
              ),
            ),
          ],
        ),
      );
    }

    Widget textButton() {
      return Container(
        margin: const EdgeInsets.only(
          top: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Login dengan email & password',
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  color: const Color(0xff031863),
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
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              header(),
              textButton(),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                margin: const EdgeInsets.only(top: 60),
                title: 'Selanjutnya',
                bgColor: isButtonActive == true
                    ? midnightBlue
                    : const Color(0xffCAC9D1),
                textColor: isButtonActive == true
                    ? whiteColor
                    : blackColor.withOpacity(0.5),
                onPressed: isButtonActive
                    ? () {
                        if (_formkey.currentState!.validate()) {
                          return nextScreenReplace(
                              const VerifLoginWhatsappPage());
                        }
                        setState(() {
                          isButtonActive = true;
                        });
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
