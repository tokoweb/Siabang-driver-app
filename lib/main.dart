import 'package:flutter/material.dart';
import 'package:siabang_driver_app/pages/createnewpassword_page.dart';
import 'package:siabang_driver_app/pages/login_page.dart';
import 'package:siabang_driver_app/pages/resetpassword_page.dart';
import 'package:siabang_driver_app/pages/splash_page.dart';
import 'package:siabang_driver_app/pages/verifloginwhatsapp_page.dart';
import 'package:siabang_driver_app/pages/verifloginemail_page.dart';
import 'package:siabang_driver_app/pages/verifresetpassword_page.dart';
import 'package:siabang_driver_app/pages/whatsapplogin_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/loginPage': (context) => LoginPage(),
        '/whatsappPage': (context) => WhatsappLoginPage(),
        '/resetPage': (context) => ResetPasswordPage(),
        '/verifloginwhatsappPage': (context) => VerifLoginWhatsappPage(),
        '/verifloginemailPage': (context) => VerifLoginEmailPage(),
        '/verifresetpasswordPage': (context) => VerifResetPasswordPage(),
        '/createnewpasswordPage': (context) => CreateNewPasswordPage(),
      },
    );
  }
}
