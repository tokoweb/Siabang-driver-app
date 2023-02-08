import 'package:flutter/material.dart';

import '../../../constant/export_constant.dart';
import '../../constant/theme.dart';

class ButtonOutline extends StatelessWidget {
  final String title;
  final Function() onTap;
  final EdgeInsets? margin;
  final Color? color;
  final bool isLoading;
  final TextStyle? textStyle;
  final bool paddingNonActive;
  final Widget? icon;
  final Color? borderColor;

  const ButtonOutline({
    Key? key,
    required this.title,
    required this.onTap,
    this.color,
    this.margin,
    this.isLoading = false,
    this.paddingNonActive = false,
    this.icon,
    this.textStyle,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: margin ?? EdgeInsets.zero,
      child: OutlinedButton(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 44)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
                color: borderColor ?? midnightBlue,
                width: 1.0,
                style: BorderStyle.solid),
          ),
        ),
        onPressed: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null)
                  Row(
                    children: [
                      icon!,
                      const SizedBox(
                        width: 13,
                      ),
                    ],
                  )
                else
                  const SizedBox(),
                if (isLoading) ...[
                  const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
                Expanded(
                  child: Text(
                    title,
                    // ignore: prefer_if_null_operators
                    style: textStyle != null
                        ? textStyle
                        : color == null
                            ? primaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              )
                            : primaryTextStyle.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: whiteColor,
                              ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
