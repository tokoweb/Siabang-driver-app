import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siabang_driver_app/theme.dart';
import 'package:siabang_driver_app/widgets/custom_button.dart';

class VerifLoginEmailPage extends StatefulWidget {
  const VerifLoginEmailPage({super.key});

  @override
  State<VerifLoginEmailPage> createState() => _VerifLoginEmailPageState();
}

class _VerifLoginEmailPageState extends State<VerifLoginEmailPage> {
  Timer? countdownTimer;
  Duration codeDuration = Duration(
    minutes: 1,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = codeDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        codeDuration = Duration(seconds: seconds);
      }
    });
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(
      () => codeDuration = Duration(minutes: 1),
    );
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(codeDuration.inMinutes.remainder(60));
    final seconds = strDigits(codeDuration.inSeconds.remainder(60));
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
              'Masukkan 6 digit kode OTP yang telah dikirimkan\nke email berikut :',
              style: primaryTextStyle.copyWith(
                color: spaceCadet,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'johndoe@gmail.com',
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
                  '$minutes:$seconds',
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
                          border: InputBorder.none, hintText: '1'),
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
                            Navigator.pushNamed(
                              context,
                              '/verifloginemailPage',
                            );
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
              SizedBox(
                height: 80,
              ),
              CustomButton(
                margin: EdgeInsets.only(top: 290),
                title: 'Verifikasi',
                bgColor: midnightBlue,
                textColor: whiteColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
