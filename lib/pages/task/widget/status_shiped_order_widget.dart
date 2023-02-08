// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/domain/commons/widgets/row_text.dart';
import 'package:siabang_driver_app/pages/task/status_order_page.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';

import '../../../constant/theme.dart';

class StatusShippedOrderWidget extends StatefulWidget {
  final STATUSDRIVER statusdriver;
  const StatusShippedOrderWidget(
      {Key? key, this.statusdriver = STATUSDRIVER.INIT})
      : super(key: key);

  @override
  State<StatusShippedOrderWidget> createState() =>
      _StatusShippedOrderWidgetState();
}

class _StatusShippedOrderWidgetState extends State<StatusShippedOrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.statusdriver == STATUSDRIVER.ARRIVED
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pengiriman ke",
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      color: blackColor,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: screenWidth(context),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: greyColor.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John doe (08123453151)",
                          style: primaryTextStyle.copyWith(
                            fontSize: 13,
                            color: blackColor,
                          ),
                        ),
                        Text(
                          "Bandung Kulon, Kota Bandung, Jawa Barat",
                          style: primaryTextStyle.copyWith(
                            fontSize: 11,
                            color: greyColor,
                          ),
                        ),
                        Text(
                          "40123",
                          style: primaryTextStyle.copyWith(
                            fontSize: 11,
                            color: greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Armada penjemputan",
                        style: primaryTextStyle.copyWith(
                          fontSize: 13,
                          color: blackColor,
                          fontWeight: semiBold,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Icon(Icons.more_vert_rounded),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: screenWidth(context),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: greyColor.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Motor (Rp80.000)",
                          style: primaryTextStyle.copyWith(
                            fontSize: 13,
                            color: blackColor,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Dimensi : 20 x 40 x 30 cm",
                          style: primaryTextStyle.copyWith(
                            fontSize: 11,
                            color: greyColor,
                          ),
                        ),
                        Text(
                          "Berat max : 40kg",
                          style: primaryTextStyle.copyWith(
                            fontSize: 11,
                            color: greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.info_outline_rounded, size: 20),
                      SizedBox(width: 4),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Estimasi penjemputan paket dilokasi anda sekitar pukul ",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 12,
                                  color: blackColor,
                                ),
                              ),
                              TextSpan(
                                text: "13:30 WIB",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: semiBold,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Divider(thickness: 2),
        ),
        Visibility(
          visible: widget.statusdriver == STATUSDRIVER.ACCEPTEDUNPAID ||
              widget.statusdriver == STATUSDRIVER.ACCEPTEDPAID,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.statusdriver == STATUSDRIVER.ACCEPTEDUNPAID
                    ? "Biaya"
                    : "Pembayaran Selesai",
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: semiBold,
                  color: widget.statusdriver == STATUSDRIVER.ACCEPTEDUNPAID
                      ? blackColor
                      : green1Color,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                width: screenWidth(context),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: greyColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(children: [
                  RowText(text1: "Biaya pengiriman", text2: "Rp80.000"),
                  RowText(text1: "Asuransi", text2: "Rp20.000"),
                  RowText(
                    text1: "Total",
                    text2: "Rp200.000",
                    textStyle1: primaryTextStyle.copyWith(
                      fontWeight: bold,
                      color: blackColor,
                    ),
                    textStyle2: primaryTextStyle.copyWith(
                      fontWeight: bold,
                      color: blackColor,
                    ),
                  ),
                ]),
              ),
              Visibility(
                visible: widget.statusdriver == STATUSDRIVER.ACCEPTEDUNPAID,
                child: SizedBox(height: 16),
              ),
              Visibility(
                visible: widget.statusdriver == STATUSDRIVER.ACCEPTEDUNPAID,
                child: ButtonPrimary(
                  title: "Lanjut Pembayaran",
                  onTap: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Divider(thickness: 2),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
