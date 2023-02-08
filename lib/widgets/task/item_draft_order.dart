// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/domain/commons/widgets/row_text.dart';

import '../../../constant/export_constant.dart';
import '../../constant/theme.dart';

class ItemDraftOrder extends StatelessWidget {
  final Function() onEdit;
  final Function() onDelete;
  final bool isEditable;
  const ItemDraftOrder({
    Key? key,
    required this.onEdit,
    required this.onDelete,
    this.isEditable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: greyColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Baju, Sepatu",
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  color: blackColor,
                ),
              ),
              Spacer(),
              Visibility(
                visible: isEditable,
                child: InkWell(
                  onTap: onEdit,
                  child: Image.asset(icEdit, width: 20, height: 20),
                ),
              ),
              Visibility(visible: isEditable, child: SizedBox(width: 10)),
              Visibility(
                visible: isEditable,
                child: InkWell(
                  onTap: onDelete,
                  child: Image.asset(icDelete, width: 20, height: 20),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          Text(
            "Pakaian",
            style: primaryTextStyle.copyWith(
              fontSize: 12,
              color: greyColor,
            ),
          ),
          Divider(thickness: 2),
          RowText(text1: "Estimasi berat", text2: "2 kg"),
          RowText(text1: "Dimensi", text2: "20 x 12 x 10 cm"),
          RowText(text1: "Berat Volume", text2: "1kg"),
          RowText(text1: "Asuransi Pengiriman", text2: "Ya"),
          Divider(thickness: 2),
          Row(
            children: [1, 2, 3].map((e) {
              return Container(
                margin: EdgeInsets.only(right: 8),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: midnightBlue,
                  borderRadius: BorderRadius.circular(5),
                ),
              );
            }).toList(),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
