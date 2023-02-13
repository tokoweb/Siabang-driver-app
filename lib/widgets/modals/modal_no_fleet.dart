import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/home_page.dart';
import 'package:siabang_driver_app/pages/main_page.dart';
import 'package:siabang_driver_app/widgets/button/button_outline.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';

import '../../constant/theme.dart';

class ModalNoFleet {
  static Future show(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      backgroundColor: Colors.transparent,
      builder: (_) {
        return const ContinueLiveChatModalView();
      },
    );
  }
}

class ContinueLiveChatModalView extends StatelessWidget {
  const ContinueLiveChatModalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
            ],
          ),
          const SizedBox(height: kToolbarHeight),
          Image.asset(
            icCar,
            width: 90,
            height: 90,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Armada penjemputan sedang\ntidak tersedia",
            style: primaryTextStyle.copyWith(
              fontSize: 13,
              color: blackColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          ButtonPrimary(
            title: "Tolak tugas",
            onTap: () {
              backScreen();
            },
          ),
          SizedBox(
            width: 11,
          ),
        ],
      ),
    );
  }
}
