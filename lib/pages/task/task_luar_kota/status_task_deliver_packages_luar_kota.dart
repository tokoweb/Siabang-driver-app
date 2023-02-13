// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/domain/commons/successful_delivery.dart';
import 'package:siabang_driver_app/domain/commons/widgets/data_photo.dart';
import 'package:siabang_driver_app/domain/commons/widgets/row_text.dart';
import 'package:siabang_driver_app/pages/task/detail_order_page.dart';
import 'package:siabang_driver_app/pages/task/task_dalam_kota/status_task_completed.dart';
import 'package:siabang_driver_app/pages/task/task_luar_kota/status_task_completed_luar_kota.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/button/button_outline.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';
import 'package:siabang_driver_app/widgets/modals/modal_image_picker.dart';
import 'package:siabang_driver_app/widgets/modals/modal_pending.dart';
import 'package:siabang_driver_app/widgets/task/task_page.dart';
import 'package:flutter/services.dart';

class StatusTaskDeliverPackagesLuarKotaPage extends StatefulWidget {
  final STATUSORDER status;
  final STATUSDRIVER statusdriver;
  final bool statusRefund;

  const StatusTaskDeliverPackagesLuarKotaPage({
    Key? key,
    this.status = STATUSORDER.PENDING,
    this.statusRefund = false,
    this.statusdriver = STATUSDRIVER.INIT,
  }) : super(key: key);

  @override
  State<StatusTaskDeliverPackagesLuarKotaPage> createState() =>
      _StatusTaskDeliverPackagesLuarKotaPageState();
}

class _StatusTaskDeliverPackagesLuarKotaPageState
    extends State<StatusTaskDeliverPackagesLuarKotaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Status orderan",
        color: Theme.of(context).scaffoldBackgroundColor,
        status: "Pengiriman dalam kota • Jemput di lokasi",
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: Color(0xff258BD4),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              "Berlangsung",
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
                      Icon(Icons.circle_outlined,
                          color: crimsonColor, size: 15),
                      Image.asset(
                        icDivider,
                        height: screenHeight(context) / 2.3,
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
                        'Antar paket ke gerai',
                        style: primaryTextStyle.copyWith(
                          fontWeight: semiBold,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Gerai Siabang Dipatiukur',
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
                        height: 20,
                      ),
                      Container(
                        width: 350,
                        child: ButtonPrimary(
                          color: Color(0xffE4E6EF),
                          title: 'Lihat arah lokasi',
                          onTap: () {},
                          icon: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(icLocation),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Upload foto bukti paket sudah diterima',
                        style: primaryTextStyle.copyWith(
                          fontSize: 13,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 95,
                            height: 95,
                            child: DataPhoto(
                              onTap: () {
                                ModalImagePicker.show(context);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 95,
                            height: 95,
                            child: DataPhoto(
                              onTap: () {
                                ModalImagePicker.show(context);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 95,
                            height: 95,
                            child: DataPhoto(
                              onTap: () {
                                ModalImagePicker.show(context);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Jemput paket di lokasi pengirim',
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
                      Row(
                        children: [
                          Container(
                            width: 170,
                            child: ButtonPrimary(
                              color: Color(0xffE4E6EF),
                              title: 'Kontak pengirim',
                              onTap: () {},
                              icon: Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(icPhone),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 170,
                            child: ButtonPrimary(
                              color: Color(0xffE4E6EF),
                              title: 'Lihat arah lokasi',
                              onTap: () {},
                              icon: Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(icLocation),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Upload foto bukti penjemputan paket',
                        style: primaryTextStyle.copyWith(
                          fontSize: 13,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 95,
                            height: 95,
                            child: DataPhoto(
                              onTap: () {
                                ModalImagePicker.show(context);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 95,
                            height: 95,
                            child: DataPhoto(
                              onTap: () {
                                ModalImagePicker.show(context);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 95,
                            height: 95,
                            child: DataPhoto(
                              onTap: () {
                                ModalImagePicker.show(context);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
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
                      nextScreen(DetailOrderPage());
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
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ButtonOutline(
                        title: 'Pending',
                        onTap: () {
                          ModalPending.show(context);
                        },
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: ButtonPrimary(
                        title: 'Selesai',
                        onTap: () {
                          nextScreen(SuccessfulDelivery(
                            onTap: () {
                              nextScreen(
                                StatusTaskCompletedLuarKotaPage(),
                              );
                            },
                          ));
                        },
                      )),
                    ],
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
