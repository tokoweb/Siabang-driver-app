import 'package:flutter/material.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';

import '../../constant/theme.dart';
import '../../widgets/multi_text/text_column.dart';

class SimInfoPage extends StatelessWidget {
  const SimInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: 'Informasi SIM',
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextColumn(title: "Jenis SIM", subtitle: "SIM A"),
                Container(
                  width: 108,
                  height: 18,
                  decoration: BoxDecoration(
                      color: crimsonColor,
                      borderRadius: BorderRadius.circular(
                        10,
                      )),
                  child: Center(
                    child: Text(
                      'Perpanjang Sim',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const TextColumn(
              title: "Tanggal berlaku",
              subtitle: "20/05/2025",
            ),
            const SizedBox(height: 16),
            Text(
              "Foto SIM",
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                color: greyColor,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [1, 4].map((e) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: midnightBlue,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 16),
            const TextColumn(title: "Jenis SIM", subtitle: "SIM C"),
            const SizedBox(height: 16),
            const TextColumn(
              title: "Tanggal berlaku",
              subtitle: "20/05/2025",
            ),
            const SizedBox(height: 16),
            Text(
              "Foto SIM",
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                color: greyColor,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [1, 4].map((e) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: midnightBlue,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
