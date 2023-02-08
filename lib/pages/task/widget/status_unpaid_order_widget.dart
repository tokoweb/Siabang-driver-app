// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';

import '../../../constant/theme.dart';

class StatusUnpaidOrderWidget extends StatefulWidget {
  const StatusUnpaidOrderWidget({Key? key}) : super(key: key);

  @override
  State<StatusUnpaidOrderWidget> createState() =>
      _StatusUnpaidOrderWidgetState();
}

class _StatusUnpaidOrderWidgetState extends State<StatusUnpaidOrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              Row(
                children: [
                  Text(
                    "Batas waktu pembayaran",
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      color: blackColor,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "12 Okt, 20:00",
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      color: blackColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.more_vert_outlined, size: 18),
                  ),
                ],
              ),
              Divider(thickness: 2),
              SizedBox(height: 10),
              Text(
                "Pembayaran melalui virtual account",
                style: primaryTextStyle.copyWith(
                  fontSize: 11,
                  color: greyColor,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: whiteColor.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 35,
                      color: midnightBlue,
                      height: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Bank BCA",
                      style: primaryTextStyle.copyWith(
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Kode pembayaran",
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  color: greyColor,
                ),
              ),
              Row(
                children: [
                  Text(
                    "1234567890123456789",
                    style: primaryTextStyle.copyWith(
                      fontSize: 11,
                      fontWeight: semiBold,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.copy, size: 20),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "Total pembayaran",
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  color: greyColor,
                ),
              ),
              Text(
                "Rp90.0000",
                style: primaryTextStyle.copyWith(
                  fontSize: 11,
                  fontWeight: semiBold,
                  color: blackColor,
                ),
              ),
              Divider(thickness: 2),
              Row(
                children: [
                  Text(
                    "Informasi pembayaran",
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      color: blackColor,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.chevron_right),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Divider(thickness: 2),
        ),
      ],
    );
  }

  Widget rowText(String text1, String text2) {
    return Row(
      children: [
        Text(
          text1,
          style: primaryTextStyle.copyWith(
            fontSize: 13,
            color: greyColor,
          ),
        ),
        Spacer(),
        Text(
          text2,
          style: primaryTextStyle.copyWith(
            fontSize: 13,
            color: greyColor,
          ),
        ),
      ],
    );
  }
}
