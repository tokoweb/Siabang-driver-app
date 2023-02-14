import 'dart:async';

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/images.dart';
import 'package:siabang_driver_app/constant/theme.dart';

import '../domain/commons/nav_utils.dart';
import 'auth/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      (() {
        nextScreenReplace(const LoginPage());
      }),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              width: 200,
              height: 212,
              margin: const EdgeInsets.only(
                top: 200,
              ),
              child: Image.asset(
                logoSiabang,
              ),
            ),
            const SizedBox(
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
            const SizedBox(
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
