import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';

import '../../../constant/theme.dart';

class StatusCanceledOrderWidget extends StatefulWidget {
  final bool isSuccessRefund;
  const StatusCanceledOrderWidget({Key? key, this.isSuccessRefund = false})
      : super(key: key);

  @override
  State<StatusCanceledOrderWidget> createState() =>
      _StatusCanceledOrderWidgetState();
}

class _StatusCanceledOrderWidgetState extends State<StatusCanceledOrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.isSuccessRefund
              ? "Pengembalian uang berhasil"
              : "Order dibatalkan",
          style: primaryTextStyle.copyWith(
            fontSize: 13,
            color: widget.isSuccessRefund ? blackColor : crimsonColor,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: screenWidth(context),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: greyColor.withOpacity(0.25),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Harap menunggu proses pengembalian uang akan dilakukan dalam 1x24 jam",
                style: primaryTextStyle.copyWith(
                  fontSize: 11,
                  color: blackColor,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: screenWidth(context),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total pengembalian",
                      style: primaryTextStyle.copyWith(
                        fontSize: 11,
                        color: greyColor,
                      ),
                    ),
                    Text(
                      "Rp90.000",
                      style: primaryTextStyle.copyWith(
                        fontSize: 11,
                        fontWeight: semiBold,
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: const Divider(thickness: 2),
        ),
      ],
    );
  }
}
