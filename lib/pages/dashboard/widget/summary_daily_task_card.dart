import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/widgets/multi_text/text_column.dart';
import 'package:siabang_driver_app/widgets/multi_text/text_row.dart';

class SummaryDailyTaskCard extends StatelessWidget {
  const SummaryDailyTaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: screenWidth(context),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(
          14,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 3),
            blurStyle: BlurStyle.outer,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: spaceCadet.withOpacity(
                0.04,
              ),
            ),
            child: Center(
              child: Text(
                'Selasa, 17 Januari',
                style: primaryTextStyle.copyWith(
                  color: greyColor,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              margin: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: TextRow(
                title: 'Jam kerja',
                subtitle: '9',
                subtitleStyle: primaryTextStyle.copyWith(
                  color: blackColor,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextColumn(
                  title: 'Tugas Masuk',
                  subtitle: '14',
                  titleStyle: primaryTextStyle.copyWith(
                    fontSize: 12,
                    color: greyColor,
                  ),
                  subtitleStyle: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  margin: 6,
                ),
                TextColumn(
                  title: 'Tugas Selesai',
                  subtitle: '12',
                  titleStyle: primaryTextStyle.copyWith(
                    fontSize: 12,
                    color: greyColor,
                  ),
                  subtitleStyle: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  margin: 6,
                ),
                TextColumn(
                  title: 'Tugas ditolak',
                  subtitle: '2',
                  titleStyle: primaryTextStyle.copyWith(
                    fontSize: 12,
                    color: greyColor,
                  ),
                  subtitleStyle: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  margin: 6,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}
