import 'package:flutter/material.dart';

import '../../constant/theme.dart';

class TextRow extends StatelessWidget {
  final String title, subtitle;
  final TextStyle? titleStyle, subtitleStyle;

  const TextRow(
      {super.key,
      required this.title,
      required this.subtitle,
      this.titleStyle,
      this.subtitleStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        const Spacer(),
        Text(
          subtitle,
          style: subtitleStyle ??
              primaryTextStyle.copyWith(
                fontSize: 12,
                color: greyColor,
              ),
        ),
      ],
    );
  }
}
