// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/domain/commons/successful_delivery.dart';
import 'package:siabang_driver_app/domain/commons/widgets/row_text.dart';
import 'package:siabang_driver_app/pages/task/detail_order_page.dart';
import 'package:siabang_driver_app/pages/task/detail_status_page.dart';
import 'package:siabang_driver_app/pages/task/widget/item_address_order.dart';
import 'package:siabang_driver_app/pages/task/widget/status_canceled_order_widget.dart';
import 'package:siabang_driver_app/pages/task/widget/status_completed_order_widget.dart';
import 'package:siabang_driver_app/pages/task/widget/status_shiped_order_widget.dart';
import 'package:siabang_driver_app/pages/task/widget/status_unpaid_order_widget.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/button/button_outline.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';
import 'package:siabang_driver_app/widgets/modals/modal_pending.dart';
import 'package:siabang_driver_app/widgets/task/task_page.dart';

class StatusOrderPage extends StatefulWidget {
  final STATUSORDER status;
  final STATUSDRIVER statusdriver;
  final bool statusRefund;

  const StatusOrderPage({
    Key? key,
    this.status = STATUSORDER.PENDING,
    this.statusRefund = false,
    this.statusdriver = STATUSDRIVER.INIT,
  }) : super(key: key);

  @override
  State<StatusOrderPage> createState() => _StatusOrderPageState();
}

class _StatusOrderPageState extends State<StatusOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Status orderan",
        color: Theme.of(context).scaffoldBackgroundColor,
        status: "Pengiriman dalam kota • Jemput di lokasi & kirim",
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
            children: [
              SizedBox(height: 16.h),
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
                  Icon(Icons.copy, size: 16),
                ],
              ),
              SizedBox(height: 8.h),
              RowText(
                  text1: "Tanggal order", text2: "12 Okt 20222 - 10:32 WIB"),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: Divider(thickness: 2),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alamat",
                    style: primaryTextStyle.copyWith(
                      fontSize: 14.sp,
                      color: blackColor,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 16),
                          Icon(Icons.circle_outlined,
                              color: crimsonColor, size: 20),
                          Image.asset(
                            icDividerVert,
                            height: screenWidth(context) / 2,
                          ),
                          Icon(Icons.circle_outlined,
                              color: crimsonColor, size: 20),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          children: [
                            ItemAddressOrderPage(
                              title: "Penjemputan dari",
                              name: "John Doe",
                              phone: "+62 1237123124",
                              address:
                                  "Bandung Kulon, Kota Bandung, Jawa Barat 40123",
                              note: "Jalan depan indomart",
                              onEditTap: () {},
                            ),
                            const SizedBox(height: 16),
                            ItemAddressOrderPage(
                              title: "Pengiriman ke",
                              name: "Jane Doe",
                              phone: "+62 12312412",
                              address:
                                  "Bandung Kulon, Kota Bandung, Jawa Barat 40123",
                              onEditTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                          nextScreen(SuccessfulDelivery());
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
