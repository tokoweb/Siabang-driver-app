// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';

import '../../../constant/theme.dart';

class StatusCompletedOrderWidget extends StatefulWidget {
  const StatusCompletedOrderWidget({Key? key}) : super(key: key);

  @override
  State<StatusCompletedOrderWidget> createState() =>
      _StatusCompletedOrderWidgetState();
}

class _StatusCompletedOrderWidgetState
    extends State<StatusCompletedOrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Paket Sudah Sampai",
          style: primaryTextStyle.copyWith(
            fontSize: 12,
            fontWeight: bold,
            color: Colors.green,
          ),
        ),
        Text(
          "Paket sudah sampai di lokasi penerima",
          style: primaryTextStyle.copyWith(
            fontSize: 11,
            color: greyColor,
          ),
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                width: 102,
                height: 102,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: midnightBlue,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8),
                width: 102,
                height: 102,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: midnightBlue,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8),
                width: 102,
                height: 102,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: midnightBlue,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Text(
              "Rating Review",
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                color: blackColor,
              ),
            ),
            Spacer(),
            Icon(Icons.chevron_right),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Divider(thickness: 2),
        ),
      ],
    );
  }
}
