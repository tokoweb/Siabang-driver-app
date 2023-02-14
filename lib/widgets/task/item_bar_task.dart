import 'package:flutter/material.dart';

import '../../constant/theme.dart';

class ItemBarOrder extends StatelessWidget {
  final bool isActive;
  final String title;
  final Function() onTap;
  const ItemBarOrder({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isActive ? ItemActive(title: title) : ItemNonActive(title: title),
    );
  }
}

class ItemNonActive extends StatelessWidget {
  final String title;
  const ItemNonActive({Key? key, required this.title}) : super(key: key);

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
          color: spaceCadet.withOpacity(0.5),
        ),
      ),
    );
  }
}

class ItemActive extends StatelessWidget {
  final String title;
  const ItemActive({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: midnightBlue,
      ),
      child: Text(
        title,
        style: primaryTextStyle.copyWith(
          fontSize: 12,
          color: whiteColor,
        ),
      ),
    );
  }
}
