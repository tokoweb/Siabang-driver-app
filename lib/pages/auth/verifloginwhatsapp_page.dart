import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/main_page.dart';
import 'package:siabang_driver_app/widgets/button/custom_button.dart';

class VerifLoginWhatsappPage extends StatefulWidget {
  const VerifLoginWhatsappPage({super.key});

  @override
  State<VerifLoginWhatsappPage> createState() => _VerifLoginWhatsappPageState();
}

class _VerifLoginWhatsappPageState extends State<VerifLoginWhatsappPage> {
  Timer? countdownTimer;
  Duration codeDuration = const Duration(
    minutes: 1,
  );
  @override
  void initState() {
    super.initState();
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    if (mounted) {
      setState(() {
        final seconds = codeDuration.inSeconds - reduceSecondsBy;
        if (seconds < 0) {
          countdownTimer!.cancel();
        } else {
          codeDuration = Duration(seconds: seconds);
        }
      });
    }
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(
      () => codeDuration = const Duration(minutes: 1),
    );
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(codeDuration.inMinutes.remainder(60));
    final seconds = strDigits(codeDuration.inSeconds.remainder(60));
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
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
            const SizedBox(
              height: 10,
            ),
            Text(
              'Masukkan 6 digit kode OTP yang telah dikirimkan\nke nomor whatsapp berikut',
              style: primaryTextStyle.copyWith(
                color: spaceCadet,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              '+62 812 3456 7890',
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
        margin: const EdgeInsets.only(
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
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '$minutes:$seconds',
                  style: primaryTextStyle.copyWith(
                    color: midnightBlue,
                  ),
                ),
              ],
            ),
            const SizedBox(
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
                      decoration: const InputDecoration(
                        hintText: '0',
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
                  const SizedBox(
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
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: '1'),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  const SizedBox(
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
                      decoration: const InputDecoration(
                        hintText: '9',
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
                  const SizedBox(
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
                      decoration: const InputDecoration(
                        hintText: '4',
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
                  const SizedBox(
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
                      decoration: const InputDecoration(
                        hintText: '2',
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
                  const SizedBox(
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
                      decoration: const InputDecoration(
                        hintText: '3',
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
            const SizedBox(
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
                        Navigator.pushNamed(
                          context,
                          '/loginPage',
                        );
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
                  onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(
                        'Apa anda yakin ?',
                        style: primaryTextStyle.copyWith(
                          color: midnightBlue,
                        ),
                      ),
                      content: Text(
                        'Kirim ulang kode verifikasi?',
                        style: primaryTextStyle.copyWith(
                          color: midnightBlue,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            resetTimer();
                            nextScreenReplace(const VerifLoginWhatsappPage());
                          },
                          child: Text(
                            'OK',
                            style: primaryTextStyle.copyWith(
                              color: spaceCadet,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: primaryTextStyle.copyWith(
                              color: spaceCadet,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              formField(),
              const SizedBox(
                height: 80,
              ),
              CustomButton(
                margin: const EdgeInsets.only(top: 290),
                title: 'Verifikasi',
                bgColor: midnightBlue,
                textColor: whiteColor,
                onPressed: () {
                  nextScreenRemoveUntil(
                    const MainScreen(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
