// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/domain/commons/successful_delivery.dart';
import 'package:siabang_driver_app/domain/commons/widgets/data_photo.dart';
import 'package:siabang_driver_app/domain/commons/widgets/row_text.dart';
import 'package:siabang_driver_app/pages/task/detail_order_page.dart';
import 'package:siabang_driver_app/pages/task/task_jemput_dilokasi/summary_detail_pick_up_page.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/button/button_outline.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';
import 'package:siabang_driver_app/widgets/modals/modal_image_picker.dart';
import 'package:siabang_driver_app/widgets/modals/modal_pending.dart';
import 'package:siabang_driver_app/widgets/task/task_page.dart';
import 'package:flutter/services.dart';

class StatusTaskLuarKotaPage extends StatefulWidget {
  final STATUSORDER status;
  final STATUSDRIVER statusdriver;
  final bool statusRefund;

  const StatusTaskLuarKotaPage({
    Key? key,
    this.status = STATUSORDER.PENDING,
    this.statusRefund = false,
    this.statusdriver = STATUSDRIVER.INIT,
  }) : super(key: key);

  @override
  State<StatusTaskLuarKotaPage> createState() => _StatusTaskLuarKotaPageState();
}

class _StatusTaskLuarKotaPageState extends State<StatusTaskLuarKotaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Status orderan",
        color: Theme.of(context).scaffoldBackgroundColor,
        status: "Pengiriman dalam kota • Kirim",
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
                  Icon(Icons.circle_outlined, color: crimsonColor, size: 15),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pengiriman paket ke gudang',
                        style: primaryTextStyle.copyWith(
                          fontWeight: semiBold,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Gudang Siabang Margahayu',
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
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
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
                      'Upload foto bukti paket sudah sampai di gudang',
                      style: primaryTextStyle.copyWith(
                        fontSize: 13,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 95,
                    height: 95,
                    child: DataPhoto(
                      onTap: () {
                        ModalImagePicker.show(
                          context,
                          () {},
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 95,
                    height: 95,
                    child: DataPhoto(
                      onTap: () {
                        ModalImagePicker.show(
                          context,
                          () {},
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 95,
                    height: 95,
                    child: DataPhoto(
                      onTap: () {
                        ModalImagePicker.show(
                          context,
                          () {},
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
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
                              text2: 'Engkel Box',
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
                              "Pengiriman luar kota",
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
                              nextScreen(SummaryTaskPickUpPage());
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
