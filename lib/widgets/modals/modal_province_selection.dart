// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';

import '../../constant/theme.dart';

class ModalProvinceSelection {
  static Future show(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      backgroundColor: Colors.transparent,
      enableDrag: true,
      isScrollControlled: true,
      builder: (_) {
        return ProvinceModalView();
      },
    );
  }
}

class ProvinceModalView extends StatefulWidget {
  const ProvinceModalView({Key? key}) : super(key: key);

  @override
  State<ProvinceModalView> createState() => _ProvinceModalViewState();
}

class _ProvinceModalViewState extends State<ProvinceModalView> {
  TextEditingController queryController = TextEditingController();
  List<String> _islands = [
    "Kalimantan",
    "Sumatra",
    "Sulawesi",
    "Papua",
    "Jawa",
    "Bali",
    "NTB",
    "NTT",
    "Maluku",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
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
            "Wilayah tujuan",
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
                children: [
                  ..._islands.map((e) {
                    return ListTile(
                      title: Text(
                        "$e",
                        style: primaryTextStyle.copyWith(
                          color: blackColor,
                        ),
                      ),
                      onTap: () {
                        backScreen(e);
                      },
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
