import 'package:flutter/material.dart';
import 'package:siabang_driver_app/theme.dart';
import 'package:siabang_driver_app/widgets/customTextForm.dart';
import 'package:siabang_driver_app/widgets/custom_button.dart';

import '../widgets/customTextFormPassword.dart';
import '../widgets/customTextFormWhatsapp.dart';

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
    // TODO: implement initState
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
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

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
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/logo_siabang.png',
                ),
              ),
            ),
            SizedBox(height: 50),
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
              SizedBox(
                height: 50,
              ),
              CustomButton(
                margin: EdgeInsets.only(top: 60),
                title: 'Selanjutnya',
                bgColor:
                    isButtonActive == true ? midnightBlue : Color(0xffCAC9D1),
                textColor: isButtonActive == true
                    ? whiteColor
                    : blackColor.withOpacity(0.5),
                onPressed: isButtonActive
                    ? () {
                        if (_formkey.currentState!.validate()) {
                          return Navigator.pushNamed(
                            context,
                            '/verifloginwhatsappPage',
                          );
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
