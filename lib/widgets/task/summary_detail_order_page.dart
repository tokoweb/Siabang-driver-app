import 'package:flutter/material.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/widgets/task/task_page.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/multi_text/text_column.dart';
import 'package:siabang_driver_app/widgets/multi_text/text_row.dart';

import '../../constant/theme.dart';

class SummaryDetailOrderPage extends StatefulWidget {
  const SummaryDetailOrderPage({super.key});

  @override
  State<SummaryDetailOrderPage> createState() => _SummaryDetailOrderPageState();
}

class _SummaryDetailOrderPageState extends State<SummaryDetailOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Status Orderan",
        color: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF08B6C1),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              "Baru",
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFE4E6EF),
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: Text("Tentukan driver untuk jemput di lokasi"),
                  ),
                  Icon(Icons.chevron_right)
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(
                  child: Text("Kode Booking"),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "98762589276160",
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.copy, size: 18),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Tanggal order",
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      color: greyColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "12 Okt 2022 - 10:32 WIB",
                    textAlign: TextAlign.right,
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      color: greyColor,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 2),
            const SizedBox(height: 16),
            Text(
              "Pilih Driver",
              style: primaryTextStyle.copyWith(
                fontWeight: bold,
                color: blackColor,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(children: const [
                Expanded(child: Text("Pilih Driver")),
                Icon(Icons.chevron_right),
              ]),
            ),
            const SizedBox(height: 16),
            const Divider(thickness: 2),
            const SizedBox(height: 16),
            Text(
              "Estimasi Biaya",
              style: primaryTextStyle.copyWith(
                fontWeight: bold,
                color: blackColor,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: greyColor.withOpacity(0.125),
              ),
              child: Column(children: [
                const TextRow(title: "Biaya pengiriman", subtitle: "Rp123.000"),
                const TextRow(title: "Jasa penjemputan", subtitle: "Rp80.000"),
                const TextRow(title: "Asuransi", subtitle: "Rp20.000"),
                TextRow(
                  title: "Total",
                  subtitle: "Rp80.000",
                  titleStyle: primaryTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 12,
                    color: blackColor,
                  ),
                  subtitleStyle: primaryTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 12,
                    color: blackColor,
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: greyColor.withOpacity(0.125),
              ),
              child: TextRow(
                title: "Komisi",
                subtitle: "Rp80.000",
                titleStyle: primaryTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 12,
                  color: blackColor,
                ),
                subtitleStyle: primaryTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 12,
                  color: blackColor,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: const Divider(thickness: 2),
            ),
            InkWell(
              onTap: () => nextScreen(const TaskPage()),
              child: Row(
                children: [
                  Expanded(
                    child: TextColumn(
                      title: "Detail orderan",
                      subtitle: "Pengiriman dalam kota",
                      titleStyle: primaryTextStyle.copyWith(
                        fontWeight: bold,
                        color: blackColor,
                      ),
                      subtitleStyle: primaryTextStyle.copyWith(
                        fontSize: 12,
                        color: greyColor,
                      ),
                    ),
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
