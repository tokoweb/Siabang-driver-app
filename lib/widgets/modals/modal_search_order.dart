import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/task/list_order_page.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';
import 'package:siabang_driver_app/widgets/customTextField/customTextField.dart';
import 'package:siabang_driver_app/widgets/customTextField/customTextForm.dart';

import '../../constant/theme.dart';

class SearchOrder {
  static Future show(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (_) {
        return const ManualSearchOrder();
      },
    );
  }
}

class ManualSearchOrder extends StatelessWidget {
  const ManualSearchOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.47,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text('Antar ke lokasi',
                style: primaryTextStyle.copyWith(
                  fontWeight: bold,
                  color: blackColor,
                )),
            SizedBox(
              height: 26,
            ),
            CustomTextField(
              title: 'No.resi',
              hintText: 'Masukkan nomor resi',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Atau',
              style: primaryTextStyle.copyWith(
                color: greyColor,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(icBarcode),
                  fit: BoxFit.cover,
                  width: 20,
                ),
                SizedBox(
                  width: 11,
                ),
                Text(
                  'Scan barcode no.resi',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    color: blackColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 42,
            ),
            ButtonPrimary(
              title: 'Cari orderan',
              onTap: () {
                nextScreen(ListOrderPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
