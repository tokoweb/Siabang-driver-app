import 'dart:async';

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/domain/commons/nav_key.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/task/detail_order_page.dart';
import 'package:siabang_driver_app/widgets/button/button_outline.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';

import '../../constant/theme.dart';

class TaskOptionDialog {
  static Future show({
    String? title,
    String? body,
    final Function()? route,
  }) async {
    return showDialog(
      context: NavKey.navKey.currentState!.context,
      builder: (BuildContext builderContext) {
        Timer(
          Duration(milliseconds: 1500),
          route ?? () {},
        );
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: TaskOptionDialogView(
            title: title,
            body: body,
          ),
        );
      },
    );
  }
}

class TaskOptionDialogView extends StatelessWidget {
  final String? title, body;

  TaskOptionDialogView({
    Key? key,
    this.title,
    this.body,
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
          SizedBox(
            height: 10,
          ),
          Container(
            width: 91,
            height: 91,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(icChecklist), fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 32),
          Text(
            title ?? '',
            style: primaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: bold,
              color: blackColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
