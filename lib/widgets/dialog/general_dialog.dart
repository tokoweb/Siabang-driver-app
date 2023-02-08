import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/domain/commons/nav_key.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/widgets/button/button_outline.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';

import '../../constant/theme.dart';

class GeneralDialog {
  static Future show({
    required Function() onTapPositive,
    required Function() onTapNegative,
    String? title,
    String? body,
    String? titlePstiveBtn,
    String? titleNgtiveBtn,
    bool reversePostionBtn = false,
  }) async {
    return showDialog(
      context: NavKey.navKey.currentState!.context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: GeneralDialogView(
            title: title,
            body: body,
            reversePostionBtn: reversePostionBtn,
            titleNgtiveBtn: titleNgtiveBtn,
            titlePstiveBtn: titlePstiveBtn,
            onTapNegative: onTapNegative,
            onTapPositive: onTapPositive,
          ),
        );
      },
    );
  }
}

class GeneralDialogView extends StatelessWidget {
  final Function() onTapPositive;
  final Function() onTapNegative;
  final String? title, body;
  final String? titlePstiveBtn, titleNgtiveBtn;
  final bool reversePostionBtn;

  const GeneralDialogView({
    Key? key,
    required this.onTapPositive,
    required this.onTapNegative,
    this.title,
    this.body,
    this.titlePstiveBtn,
    this.titleNgtiveBtn,
    this.reversePostionBtn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: screenWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: whiteColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title ?? "Title",
            style: primaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: bold,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            body ?? "body",
            textAlign: TextAlign.center,
            style: primaryTextStyle.copyWith(
              fontSize: 12,
              color: blackColor,
            ),
          ),
          SizedBox(height: 32),
          reversePostionBtn
              ? Row(
                  children: [
                    Expanded(
                      child: ButtonOutline(
                        title: titleNgtiveBtn ?? "Tidak",
                        onTap: () {
                          backScreen();
                          onTapNegative();
                        },
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: ButtonPrimary(
                        title: titlePstiveBtn ?? "Ya",
                        onTap: () {
                          backScreen();
                          onTapPositive();
                        },
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: ButtonPrimary(
                        title: titleNgtiveBtn ?? "Tidak",
                        onTap: () {
                          backScreen();

                          onTapNegative();
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ButtonOutline(
                        title: titlePstiveBtn ?? "Ya",
                        onTap: () {
                          backScreen();
                          onTapPositive();
                        },
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
