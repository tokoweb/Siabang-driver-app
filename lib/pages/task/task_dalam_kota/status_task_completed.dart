// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/domain/commons/widgets/row_text.dart';
import 'package:siabang_driver_app/pages/task/task_dalam_kota/summary_detail_page.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/task/task_page.dart';
import 'package:flutter/services.dart';

class StatusTaskCompletedPage extends StatefulWidget {
  final STATUSORDER status;
  final STATUSDRIVER statusdriver;
  final bool statusRefund;

  const StatusTaskCompletedPage({
    Key? key,
    this.status = STATUSORDER.PENDING,
    this.statusRefund = false,
    this.statusdriver = STATUSDRIVER.INIT,
  }) : super(key: key);

  @override
  State<StatusTaskCompletedPage> createState() =>
      _StatusTaskCompletedPageState();
}

class _StatusTaskCompletedPageState extends State<StatusTaskCompletedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        onBack: () {
          backScreenUntil();
        },
        title: "Status orderan",
        color: Theme.of(context).scaffoldBackgroundColor,
        status: "Pengiriman dalam kota • Jemput di lokasi & kirim",
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: Color(0xff27AE60),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              "Selesai",
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    widget.status != STATUSORDER.PENDING
                        ? "No. Resi"
                        : "Kode booking",
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      color: blackColor,
                    ),
                  ),
                  Spacer(),
                  Text(widget.status != STATUSORDER.PENDING
                      ? "987yhE62w"
                      : "123456789123456"),
                  SizedBox(width: 10),
                  GestureDetector(
                      onTap: () async {
                        await Clipboard.setData(
                          ClipboardData(
                            text: widget.status != STATUSORDER.PENDING
                                ? '987yhE62w'
                                : '123456789123456',
                          ),
                        );
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(
                            seconds: 2,
                          ),
                          content: Text(
                            'Copied',
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: midnightBlue,
                        ));
                      },
                      child: Icon(Icons.copy, size: 16)),
                ],
              ),
              SizedBox(height: 8.h),
              RowText(
                  text1: "Tanggal order", text2: "12 Okt 20222 - 10:32 WIB"),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: Divider(thickness: 2),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Icon(Icons.circle, color: Color(0xff27AE60), size: 15),
                      Image.asset(
                        icDividerGreen,
                        height: screenHeight(context) / 2.9,
                      ),
                      Icon(
                        Icons.circle,
                        color: Color(0xff27AE60),
                        size: 15,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Antar paket ke lokasi penerima',
                        style: primaryTextStyle.copyWith(
                          fontWeight: semiBold,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'John Doe (081234567890)',
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: semiBold,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Bandung Kulon, Kota Bandung, Jawa Barat\n40123',
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(icNote),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Depan jalan samping indomart',
                            style: primaryTextStyle.copyWith(
                              fontSize: 12,
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Foto bukti paket sudah diterima',
                        style: primaryTextStyle.copyWith(
                          fontSize: 13,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [1, 2, 3].map((e) {
                          return Container(
                            margin: EdgeInsets.only(right: 8),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: midnightBlue,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Antar paket ke lokasi penerima',
                        style: primaryTextStyle.copyWith(
                          fontWeight: semiBold,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'John Doe (081234567890)',
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: semiBold,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Bandung Kulon, Kota Bandung, Jawa Barat\n40123',
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(icNote),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Depan jalan samping indomart',
                            style: primaryTextStyle.copyWith(
                              fontSize: 12,
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Foto bukti penjemputan paket',
                        style: primaryTextStyle.copyWith(
                          fontSize: 13,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [1, 2, 3].map((e) {
                          return Container(
                            margin: EdgeInsets.only(right: 8),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: midnightBlue,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: Divider(thickness: 2),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...[
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Container(
                        width: screenWidth(context),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: greyColor.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          children: [
                            RowText(
                              text1: 'Armada penjemputan',
                              textStyle1: primaryTextStyle.copyWith(
                                color: blackColor,
                              ),
                              text2: 'Motor',
                              textStyle2: primaryTextStyle.copyWith(
                                fontWeight: semiBold,
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            RowText(
                              text1: 'Metode pembayaran',
                              textStyle1: primaryTextStyle.copyWith(
                                color: blackColor,
                              ),
                              text2: 'Tunai (COD)',
                              textStyle2: primaryTextStyle.copyWith(
                                fontWeight: semiBold,
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            RowText(
                              text1: 'Total pembayaran',
                              textStyle1: primaryTextStyle.copyWith(
                                color: blackColor,
                              ),
                              text2: 'Rp 90.000',
                              textStyle2: primaryTextStyle.copyWith(
                                fontWeight: semiBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  SizedBox(
                    height: 30,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      nextScreen(SummaryTaskDalamKotaPage());
                    },
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Detail orderan",
                              style: primaryTextStyle.copyWith(
                                fontWeight: semiBold,
                                color: blackColor,
                              ),
                            ),
                            Text(
                              "Pengiriman dalam kota",
                              style: primaryTextStyle.copyWith(
                                fontSize: 11,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
