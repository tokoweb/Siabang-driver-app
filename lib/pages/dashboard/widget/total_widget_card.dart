import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/widgets/multi_text/text_column.dart';

class TotalWidgetCard extends StatelessWidget {
  const TotalWidgetCard(
      {super.key,
      this.height,
      this.backgroundColor,
      required this.title,
      this.titleStyle,
      this.subtitleStyle,
      required this.subtitle});

  final double? height;
  final Color? backgroundColor;
  final String title;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16,
        ),
        color: backgroundColor ?? const Color(0xff1C2F72),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          top: 16,
          bottom: 16,
        ),
        child: TextColumn(
          title: title,
          subtitle: subtitle,
          titleStyle: titleStyle,
          subtitleStyle: subtitleStyle,
        ),
      ),
    );
  }
}
