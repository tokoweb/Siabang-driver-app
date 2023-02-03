import 'dart:async';

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      (() {
        Navigator.pushNamedAndRemoveUntil(
            context, '/loginPage', (route) => false);
      }),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              width: 200,
              height: 212,
              margin: EdgeInsets.only(
                top: 200,
              ),
              child: Image.asset(
                'assets/logo_siabang.png',
              ),
            ),
            SizedBox(
              height: 23,
            ),
            Text(
              'Pengiriman barang ke seluruh\nIndonesia',
              textAlign: TextAlign.center,
              style: primaryTextStyle.copyWith(
                color: spaceCadet,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 271,
            ),
            Text(
              'Copyright 2022. Siabang All Right Reserved',
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: light,
                color: spaceCadet.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
