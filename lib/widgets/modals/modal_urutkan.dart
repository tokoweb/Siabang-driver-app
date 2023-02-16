// ignore_for_file: prefer_const_constructors, prefer_final_fields
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/task/detail_status_task_reject.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';
import 'package:siabang_driver_app/widgets/dialog/success_task_option_dialog.dart';

import '../../constant/theme.dart';

class ModalUrutkanTask {
  static Future show(BuildContext context, {String? initialValue}) async {
    return await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      isScrollControlled: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return DeliveryRejectTaskView(initialValue: initialValue);
      },
    );
  }
}

class DeliveryRejectTaskView extends StatefulWidget {
  final String? initialValue;
  const DeliveryRejectTaskView({Key? key, this.initialValue}) : super(key: key);

  @override
  State<DeliveryRejectTaskView> createState() => _DeliveryRejectTaskViewState();
}

class _DeliveryRejectTaskViewState extends State<DeliveryRejectTaskView> {
  TextEditingController queryController = TextEditingController();
  String? value;
  List<Map<String, dynamic>> _couriers = [
    {
      "desc": "Terbaru",
    },
    {
      "desc": "Terlama",
    },
  ];
  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) / 3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            "Urutkan",
            style: primaryTextStyle.copyWith(
              fontWeight: bold,
              color: blackColor,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      bottom: 10,
                    ),
                  ),
                  ..._couriers.map((e) {
                    return ListTile(
                      leading: Radio(
                        groupValue: value,
                        activeColor: midnightBlue,
                        value: e['desc'] as String,
                        onChanged: (String? val) {
                          value = val ?? "";
                          setState(() {});
                        },
                      ),
                      title: Text(
                        "${e['desc']}",
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          color: blackColor,
                        ),
                      ),
                      onTap: () {
                        value = e['desc'];
                        setState(() {});
                      },
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: ButtonPrimary(
              title: "Tampilkan",
              onTap: () {
                backScreen();
              },
            ),
          ),
        ],
      ),
    );
  }
}
