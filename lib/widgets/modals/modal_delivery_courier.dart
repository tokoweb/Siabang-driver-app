// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';

import '../../../constant/export_constant.dart';
import '../../constant/theme.dart';

class ModalDeliveryCourier {
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
        return DeliveryCourierModalView(initialValue: initialValue);
      },
    );
  }
}

class DeliveryCourierModalView extends StatefulWidget {
  final String? initialValue;
  const DeliveryCourierModalView({Key? key, this.initialValue})
      : super(key: key);

  @override
  State<DeliveryCourierModalView> createState() =>
      _DeliveryCourierModalViewState();
}

class _DeliveryCourierModalViewState extends State<DeliveryCourierModalView> {
  TextEditingController queryController = TextEditingController();
  String? value;
  List<Map<String, dynamic>> _couriers = [
    {
      "name": "Motor (Rp80.000)",
      "max_dimension": "20 x 40 x 30 cm",
      "max_weight": "40kg"
    },
    {
      "name": "Pickup Box (Rp200.000)",
      "max_dimension": "210 x 510 x 150 cm",
      "max_weight": "700kg"
    },
    {
      "name": "Engkel Box (Rp300.000)",
      "max_dimension": "210 x 510 x 150 cm",
      "max_weight": "700kg"
    },
    {
      "name": "CDE Engkel Box (Rp400.000)",
      "max_dimension": "210 x 510 x 150 cm",
      "max_weight": "700kg"
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
      height: screenHeight(context) * 0.55,
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
            "Armada Penjemputan",
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  ..._couriers.map((e) {
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${e['name']}",
                            style: primaryTextStyle.copyWith(
                              fontSize: 14,
                              color: blackColor,
                            ),
                          ),
                          Text(
                            "Dimensi max : ${e['max_dimension']}",
                            style: primaryTextStyle.copyWith(
                              fontSize: 11,
                              color: greyColor,
                            ),
                          ),
                          Text(
                            "Berat max : ${e['max_weight']}",
                            style: primaryTextStyle.copyWith(
                              fontSize: 11,
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        value = e['name'];
                        setState(() {});
                      },
                      trailing: Radio(
                        groupValue: value,
                        activeColor: midnightBlue,
                        value: e['name'] as String,
                        onChanged: (String? val) {
                          value = val ?? "";
                          setState(() {});
                        },
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: ButtonPrimary(
              title: "Pilih",
              onTap: () {
                backScreen(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
