// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/task/status_order_page.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';
import 'package:siabang_driver_app/widgets/modals/modal_no_fleet.dart';
import 'package:siabang_driver_app/widgets/modals/modal_reject_task.dart';

import '../../../constant/export_constant.dart';
import '../../constant/theme.dart';

class ModalDeliveryCourier {
  static Future show(BuildContext context,
      {String? initialValue, Function()? onTap}) async {
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
        return DeliveryCourierModalView(
          initialValue: initialValue,
          onTap: onTap,
        );
      },
    );
  }
}

class DeliveryCourierModalView extends StatefulWidget {
  final String? initialValue;
  final Function()? onTap;

  DeliveryCourierModalView({Key? key, this.initialValue, this.onTap})
      : super(key: key);

  @override
  State<DeliveryCourierModalView> createState() =>
      _DeliveryCourierModalViewState();
}

class _DeliveryCourierModalViewState extends State<DeliveryCourierModalView> {
  TextEditingController queryController = TextEditingController();
  Function()? onTap;
  String? value;
  List<Map<String, dynamic>> _couriers = [
    {
      "id": "D 1939 YU",
      "transportation_type": "Motor",
    },
    {
      "id": "D 1139 YU",
      "transportation_type": "Motor",
    },
    {
      "id": "D 1929 YU",
      "transportation_type": "Motor",
    },
    {
      "id": "D 1339 YU",
      "transportation_type": "Motor",
    },
  ];
  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
    onTap = widget.onTap;
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
            "Pilih armada",
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
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  icVehicle,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${e['id']}",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 14,
                                  color: blackColor,
                                ),
                              ),
                              Text(
                                "${e['transportation_type']}",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 11,
                                  color: greyColor,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {
                        value = e['id'];
                        setState(() {});
                      },
                      trailing: Radio(
                        groupValue: value,
                        activeColor: midnightBlue,
                        value: e['id'] as String,
                        onChanged: (String? val) {
                          value = val ?? "";
                          setState(() {
                            ModalNoFleet.show(context);
                          });
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
            child: ButtonPrimary(title: "Pilih", onTap: onTap ?? () {}),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
