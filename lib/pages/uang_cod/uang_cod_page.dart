import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/uang_cod/successful_deposit_page.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/button/custom_button.dart';
import 'package:siabang_driver_app/widgets/multi_text/text_column.dart';
import 'package:siabang_driver_app/widgets/multi_text/text_row.dart';

import '../../domain/commons/widgets/data_photo.dart';
import '../../widgets/modals/modal_image_picker.dart';

class UangCodPage extends StatelessWidget {
  const UangCodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: 'Setor uang COD',
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        margin: const EdgeInsets.all(
          16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth(context),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: greyColor.withOpacity(0.125),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextRow(
                    title: 'Uang cod hari ini',
                    titleStyle: primaryTextStyle.copyWith(
                      color: spaceCadet,
                    ),
                    subtitle: '18 sep 2022',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Rp 392.000',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                      color: spaceCadet,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 1,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: TextColumn(
                title: 'Bukti setor',
                titleStyle: primaryTextStyle.copyWith(
                  fontWeight: semiBold,
                  color: spaceCadet,
                ),
                margin: 20,
                subtitle: 'Upload foto bukti penyetoran',
                subtitleStyle: primaryTextStyle.copyWith(
                  color: greyColor,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 102,
              height: 102,
              child: DataPhoto(
                onTap: () {
                  ModalImagePicker.show(
                    context,
                    () {},
                  );
                },
              ),
            ),
            const Spacer(),
            CustomButton(
              margin: const EdgeInsets.only(),
              title: 'Selesai',
              textColor: whiteColor,
              bgColor: midnightBlue,
              onPressed: () {
                nextScreen(
                  const SuccessDepositPage(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
