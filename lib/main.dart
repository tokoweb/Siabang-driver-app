// ignore_for_file: avoid_redundant_argument_values, prefer_const_constructors

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:siabang_driver_app/domain/commons/nav_key.dart';
import 'package:siabang_driver_app/pages/main_view_provider.dart';
import 'package:siabang_driver_app/pages/main_view_provider.dart';
import 'package:siabang_driver_app/pages/splash_page.dart';

import 'domain/commons/nav_key.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await AppTrackingTransparency.requestTrackingAuthorization();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Future<dynamic> onSelectNotification(String? payload) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(payload!),
        content: Text("Payload: $payload"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => MainViewProvider()),
          ],
          child: MaterialApp(
            useInheritedMediaQuery: true,
            navigatorKey: NavKey.navKey,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            title: 'Siabang Driver',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: SplashPage(),
          ),
        );
      },
    );
  }
}
