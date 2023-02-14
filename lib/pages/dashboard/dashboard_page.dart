import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/images.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/domain/commons/widgets/row_text.dart';
import 'package:siabang_driver_app/pages/dashboard/widget/total_widget_card.dart';
import 'package:siabang_driver_app/pages/uang_cod/uang_cod_page.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Widget buttonUangCod() {
    return ElevatedButton(
      onPressed: () {
        nextScreen(const UangCodPage());
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: aliceBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        backgroundColor: const Color(
          0xff1C2F72,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            icRp,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'Uang Cod',
            style: primaryTextStyle.copyWith(
              color: whiteColor.withOpacity(
                0.7,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      height: 450,
      decoration: BoxDecoration(
        color: midnightBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TotalWidgetCard(
                    height: 84,
                    title: 'Total jam kerja',
                    subtitle: '1287',
                    titleStyle: primaryTextStyle.copyWith(
                      fontSize: 12,
                      color: whiteColor.withOpacity(0.5),
                    ),
                    subtitleStyle: primaryTextStyle.copyWith(
                      color: whiteColor,
                      fontWeight: semiBold,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TotalWidgetCard(
                    height: 84,
                    title: 'Total tugas masuk',
                    subtitle: '401',
                    titleStyle: primaryTextStyle.copyWith(
                      fontSize: 12,
                      color: whiteColor.withOpacity(0.5),
                    ),
                    subtitleStyle: primaryTextStyle.copyWith(
                      color: whiteColor,
                      fontWeight: semiBold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TotalWidgetCard(
                    height: 84,
                    title: 'Total tugas selesai',
                    subtitle: '345',
                    titleStyle: primaryTextStyle.copyWith(
                      fontSize: 12,
                      color: whiteColor.withOpacity(0.5),
                    ),
                    subtitleStyle: primaryTextStyle.copyWith(
                      color: whiteColor,
                      fontWeight: semiBold,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TotalWidgetCard(
                    height: 84,
                    title: 'Total tugas ditolak',
                    subtitle: '56',
                    titleStyle: primaryTextStyle.copyWith(
                      fontSize: 12,
                      color: whiteColor.withOpacity(0.5),
                    ),
                    subtitleStyle: primaryTextStyle.copyWith(
                      color: whiteColor,
                      fontWeight: semiBold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget content() {
    return Container(
      margin: const EdgeInsets.only(
        top: 230,
      ),
      width: double.infinity,
      height: screenHeight(context),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            30,
          ),
          topRight: Radius.circular(
            30,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.chevron_left),
                Text(
                  'Januari 2023 ',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const Icon(Icons.chevron_right),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: screenWidth(context),
              height: 42,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: spaceCadet.withOpacity(0.04)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RowText(
                  text1: 'Jam Kerja',
                  text2: '120',
                  textStyle2: primaryTextStyle.copyWith(
                    color: blackColor,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TotalWidgetCard(
                    backgroundColor: spaceCadet.withOpacity(0.04),
                    title: 'Tugas masuk',
                    subtitle: '98',
                    subtitleStyle: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                      color: blackColor,
                    ),
                    titleStyle: primaryTextStyle.copyWith(
                      color: spaceCadet.withOpacity(0.5),
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TotalWidgetCard(
                    backgroundColor: spaceCadet.withOpacity(0.04),
                    title: 'Tugas selesai',
                    subtitle: '80',
                    subtitleStyle: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                      color: blackColor,
                    ),
                    titleStyle: primaryTextStyle.copyWith(
                      color: spaceCadet.withOpacity(0.5),
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TotalWidgetCard(
                    backgroundColor: spaceCadet.withOpacity(0.04),
                    title: 'Tugas ditolak',
                    subtitle: '19',
                    subtitleStyle: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                      color: blackColor,
                    ),
                    titleStyle: primaryTextStyle.copyWith(
                      color: spaceCadet.withOpacity(0.5),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPrimary(
        title: 'Dashboard',
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            header(),
            content(),
          ],
        ),
      ),
    );
  }
}
