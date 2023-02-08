// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/domain/commons/widgets/row_text.dart';
import 'package:siabang_driver_app/pages/task/detail_order_page.dart';
import 'package:siabang_driver_app/pages/task/detail_status_page.dart';
import 'package:siabang_driver_app/pages/task/widget/status_canceled_order_widget.dart';
import 'package:siabang_driver_app/pages/task/widget/status_completed_order_widget.dart';
import 'package:siabang_driver_app/pages/task/widget/status_shiped_order_widget.dart';
import 'package:siabang_driver_app/pages/task/widget/status_unpaid_order_widget.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';

enum STATUSORDER { UNPAID, ONPROGRESS, COMPlETED, CANCELED }

enum STATUSDRIVER { INIT, ACCEPTEDUNPAID, ACCEPTEDPAID, ARRIVED }

class StatusOrderPage extends StatefulWidget {
  final STATUSORDER status;
  final STATUSDRIVER statusdriver;
  final bool statusRefund;

  const StatusOrderPage({
    Key? key,
    this.status = STATUSORDER.UNPAID,
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
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: midnightBlue.withOpacity(0.125),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  if (widget.status == STATUSORDER.ONPROGRESS) {
                    nextScreen(DetailStatusPage());
                  }
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        () {
                          switch (widget.status) {
                            case STATUSORDER.UNPAID:
                              return "Menunggu pemabayaran";
                            case STATUSORDER.ONPROGRESS:
                              if (widget.statusdriver ==
                                  STATUSDRIVER.ACCEPTEDUNPAID) {
                                return "Driver sedang menuju lokasi penjemputan (lanju...";
                              }
                              if (widget.statusdriver ==
                                  STATUSDRIVER.ACCEPTEDPAID) {
                                return "Driver sedang menuju lokasi penjemputan (lanju...";
                              }
                              return "Menunggu penjemputan paket di lokasi";

                            case STATUSORDER.COMPlETED:
                              return "Paket sudah diterima dilokasi tujuan";
                            case STATUSORDER.CANCELED:
                              if (widget.statusRefund) {
                                return "Proses pengembalian berhasil";
                              }
                              return "Orderan telah dibatalkan";
                          }
                        }(),
                        overflow: TextOverflow.ellipsis,
                        style: primaryTextStyle.copyWith(
                            color: blackColor, fontSize: 12),
                      ),
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  widget.status != STATUSORDER.UNPAID
                      ? "No. Resi"
                      : "Kode booking",
                  style: primaryTextStyle.copyWith(
                    fontSize: 13,
                    color: blackColor,
                  ),
                ),
                Spacer(),
                Text(widget.status != STATUSORDER.UNPAID
                    ? "987yhE62w"
                    : "123456789123456"),
                SizedBox(width: 10),
                Icon(Icons.copy, size: 16),
              ],
            ),
            SizedBox(height: 8.h),
            RowText(text1: "Tanggal order", text2: "12 Okt 20222 - 10:32 WIB"),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child: Divider(thickness: 2),
            ),
            ...[
              Container(
                child: () {
                  if (widget.status == STATUSORDER.ONPROGRESS) {
                    return StatusShippedOrderWidget(
                      statusdriver: widget.statusdriver,
                    );
                  }
                  if (widget.status == STATUSORDER.COMPlETED) {
                    return StatusCompletedOrderWidget();
                  }
                  if (widget.status == STATUSORDER.CANCELED) {
                    return StatusCanceledOrderWidget(
                      isSuccessRefund: widget.statusRefund,
                    );
                  }
                  return StatusUnpaidOrderWidget();
                }(),
              ),
            ],
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
          ],
        ),
      ),
    );
  }
}
