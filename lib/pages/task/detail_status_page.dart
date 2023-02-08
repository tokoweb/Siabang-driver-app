import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';

import '../../constant/theme.dart';

class DetailStatusPage extends StatefulWidget {
  const DetailStatusPage({Key? key}) : super(key: key);

  @override
  State<DetailStatusPage> createState() => _DetailStatusPageState();
}

class _DetailStatusPageState extends State<DetailStatusPage> {
  int currentStep = 0;
  List<Map<String, dynamic>> statuses = [
    {
      "title": "12 okt 2022 - 10:30 WIB",
      "detail": "Paket sudah diterima di lokasi tujuan",
      "image_contain": true,
    },
    {
      "title": "12 okt 2022 - 10:30 WIB",
      "detail":
          "Paket sudah dijemput oleh driver dan sedang menuju ke lokasi penerima",
      "image_contain": false,
    },
    {
      "title": "12 okt 2022 - 10:30 WIB",
      "detail": "Pembayaran telah diverifikasi",
      "image_contain": false,
    },
    {
      "title": "12 okt 2022 - 10:30 WIB",
      "detail":
          "Driver sedang menuju lokasi penjemputan. Harap untuk segera melanjutkan ke proses pembayaran",
      "image_contain": false,
    },
    {
      "title": "12 okt 2022 - 10:30 WIB",
      "detail":
          "Orderan telah dikirim dan menunggu penjemputan paket oleh driver",
      "image_contain": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Detail Status",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Stepper(
              type: StepperType.vertical,
              currentStep: currentStep,
              steps: statuses.map((data) {
                return Step(
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${data['title']}",
                          style: primaryTextStyle.copyWith(
                            fontSize: 12,
                            color: greyColor,
                          ),
                        ),
                        Text(
                          "${data['detail']}",
                          style: primaryTextStyle.copyWith(
                            fontSize: 12,
                            color: greyColor,
                          ),
                        ),
                      ]),
                  content: data['image_contain'] == true
                      ? Row(
                          children: [1, 2, 3].map((e) {
                            return Container(
                              height: 40,
                              width: 40,
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                color: midnightBlue,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          }).toList(),
                        )
                      : const SizedBox(height: 0),
                );
              }).toList(),
              controlsBuilder: (context, details) {
                return Row(
                  children: [],
                );
              },
              onStepTapped: (value) {
                currentStep = value;
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
