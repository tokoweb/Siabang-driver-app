import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';

import '../../constant/theme.dart';

class TextColumn extends StatelessWidget {
  final String title, subtitle;
  final TextStyle? titleStyle, subtitleStyle;

  const TextColumn(
      {super.key,
      required this.title,
      required this.subtitle,
      this.titleStyle,
      this.subtitleStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ??
              primaryTextStyle.copyWith(
                fontSize: 12,
                color: greyColor,
              ),
        ),
        Text(
          subtitle,
          style: subtitleStyle ??
              primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: bold,
                color: blackColor,
              ),
        ),
      ],
    );
  }
}
