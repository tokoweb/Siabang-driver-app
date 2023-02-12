import 'package:flutter/material.dart';

import '../../../../constant/export_constant.dart';
import '../../../constant/theme.dart';

class ItemAddressOrderPage extends StatelessWidget {
  final String title, name, phone, address;
  final Function() onEditTap;
  final String? note;
  final bool isEditable;

  const ItemAddressOrderPage({
    Key? key,
    required this.title,
    required this.name,
    required this.phone,
    required this.address,
    required this.onEditTap,
    this.note,
    this.isEditable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: screenWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: greyColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: primaryTextStyle.copyWith(
                  color: greyColor,
                ),
              ),
              const Spacer(),
              Visibility(
                visible: isEditable,
                child: InkWell(
                  onTap: onEditTap,
                  child: Image.asset(icEdit, width: 20),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "$name ($phone)",
            style: primaryTextStyle.copyWith(
              fontWeight: bold,
              fontSize: 12,
              color: blackColor,
            ),
          ),
          Text(
            address,
            style: primaryTextStyle.copyWith(
              fontSize: 12,
              color: blackColor,
            ),
          ),
          Center(child: SizedBox(height: note != null ? 10 : 0)),
          Visibility(
            visible: note != null,
            child: Row(
              children: [
                Image.asset(
                  icNote,
                ),
                const SizedBox(width: 4),
                Text(
                  note ?? "",
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    color: blackColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
