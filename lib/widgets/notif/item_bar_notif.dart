import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/theme.dart';

import '../../../constant/export_constant.dart';

class ItemBarNotif extends StatelessWidget {
  final bool isActive;
  final String title;
  final Function() onTap;
  const ItemBarNotif({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isActive
          ? ItemNotifActive(title: title)
          : ItemNotifNonActive(title: title),
    );
  }
}

class ItemNotifNonActive extends StatelessWidget {
  final String title;
  const ItemNotifNonActive({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: greyColor.withOpacity(0.5),
      ),
      child: Text(
        title,
        style: primaryTextStyle.copyWith(
          fontSize: 12,
        ),
      ),
    );
  }
}

class ItemNotifActive extends StatelessWidget {
  final String title;
  const ItemNotifActive({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: spaceCadet,
      ),
      child: Text(
        title,
        style: primaryTextStyle.copyWith(
          fontSize: 12,
        ),
      ),
    );
  }
}
