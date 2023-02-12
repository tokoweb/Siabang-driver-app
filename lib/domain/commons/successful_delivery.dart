import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/task/status_order_page.dart';
import 'package:siabang_driver_app/widgets/button/button_outline.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';
import 'package:siabang_driver_app/widgets/task/task_page.dart';

import '../../constant/theme.dart';

class SuccessfulDelivery extends StatelessWidget {
  const SuccessfulDelivery({Key? key}) : super(key: key);

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
                imSuccess,
                width: 180,
                height: 180,
              ),
              const SizedBox(height: 10),
              Text(
                "Pengiriman berhasil",
                style: primaryTextStyle.copyWith(
                    fontSize: 18, fontWeight: bold, color: blackColor),
              ),
              const SizedBox(height: 16),
              Text(
                "Terima Kasih telah berhasil\nmengirim paket ini",
                textAlign: TextAlign.center,
                style: primaryTextStyle.copyWith(
                  color: blackColor,
                ),
              ),
              const SizedBox(height: 20),
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
