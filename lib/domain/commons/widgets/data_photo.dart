import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';

import '../../../constant/theme.dart';

class DataPhoto extends StatelessWidget {
  final Function() onTap;
  const DataPhoto({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        color: greyColor,
        borderType: BorderType.RRect,
        dashPattern: const [6, 2],
        radius: const Radius.circular(16),
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Image(
            image: AssetImage(icAdd),
            width: 24,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
