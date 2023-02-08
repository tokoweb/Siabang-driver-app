import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../constant/export_constant.dart';
import '../../../constant/theme.dart';

class RowText extends StatelessWidget {
  final String text1, text2;
  final TextStyle? textStyle1, textStyle2;
  const RowText(
      {Key? key,
      required this.text1,
      required this.text2,
      this.textStyle1,
      this.textStyle2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: textStyle1 ??
              primaryTextStyle.copyWith(
                fontSize: 13,
                color: greyColor,
              ),
        ),
        const Spacer(),
        Text(
          text2,
          style: textStyle2 ??
              primaryTextStyle.copyWith(
                fontSize: 13,
                color: greyColor,
              ),
        ),
      ],
    );
  }
}
