import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';

import '../../constant/theme.dart';

class ButtonPrimary extends StatelessWidget {
  final String title;
  final Function() onTap;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? color;
  final bool isLoading;
  final TextStyle? textStyle;
  final bool paddingNonActive;
  final Widget? icon;
  final bool isTrailingIcon;
  final AlignmentGeometry? alignment;
  final double? size;
  final bool enabled;

  const ButtonPrimary(
      {Key? key,
      required this.title,
      required this.onTap,
      this.color,
      this.margin,
      this.isLoading = false,
      this.paddingNonActive = false,
      this.icon,
      this.textStyle,
      this.isTrailingIcon = false,
      this.alignment,
      this.padding,
      this.size,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 50,
      margin: margin ?? EdgeInsets.zero,
      child: TextButton(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 44)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          ),
          backgroundColor: MaterialStateProperty.all(
            !enabled ? Colors.grey : color ?? midnightBlue,
          ),
        ),
        onPressed: () {
          if (enabled) onTap();
        },
        child: Container(
          padding: padding ?? EdgeInsets.zero,
          child: Align(
            alignment: alignment ?? Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (icon != null && isTrailingIcon == false)
                  Row(
                    children: [
                      icon!,
                      const SizedBox(
                        width: 5,
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
                Text(
                  title,
                  // ignore: prefer_if_null_operators
                  style: textStyle != null
                      ? textStyle
                      : color == null
                          ? primaryTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                            )
                          : primaryTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: spaceCadet,
                            ),
                  textAlign: TextAlign.center,
                ),
                if (icon != null && isTrailingIcon == true)
                  Row(
                    children: [
                      const SizedBox(
                        width: 13,
                      ),
                      icon!,
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
