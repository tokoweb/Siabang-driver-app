import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/task/status_order_page.dart';
import 'package:siabang_driver_app/widgets/button/button_outline.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';

import '../../constant/theme.dart';

class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                icSuccess,
                width: 180,
                height: 180,
              ),
              const SizedBox(height: 10),
              Text(
                "Berhasil Dikirim",
                style: primaryTextStyle.copyWith(
                    fontSize: 18, fontWeight: bold, color: blackColor),
              ),
              const SizedBox(height: 16),
              Text(
                "Detail orderan anda telah dikirim.\nHarap menunggu driver kami untuk menjemput\npaket dilokasi anda",
                textAlign: TextAlign.center,
                style: primaryTextStyle.copyWith(
                  color: blackColor,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.info),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: primaryTextStyle.copyWith(
                            fontSize: 12,
                            color: greyColor,
                          ),
                          text:
                              "Estimasi penjemputan paket dilokasi anda sekitar pukul ",
                          children: [
                            TextSpan(
                              text: "13:30 WIB",
                              style: primaryTextStyle.copyWith(
                                color: blackColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: greyColor.withOpacity(0.2),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ButtonOutline(
                      title: "Kembali",
                      onTap: () {
                        backScreenUntil();
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ButtonPrimary(
                      title: "Lihat status",
                      onTap: () {
                        backScreenUntil();
                        nextScreen(
                            StatusOrderPage(status: STATUSORDER.ONPROGRESS));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
