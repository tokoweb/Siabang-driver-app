import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/widgets/button/button_outline.dart';

class SuccessDepositPage extends StatelessWidget {
  const SuccessDepositPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                imSuccess,
              ),
              width: 180,
              height: 180,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Penyetoran Selesai',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
                color: spaceCadet,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Terima Kasih telah melakukan\npenyetoran uang COD',
              style: primaryTextStyle.copyWith(
                color: blackColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 158,
              height: 50,
              child: ButtonOutline(
                title: 'Kembali',
                onTap: () {
                  backScreen();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
