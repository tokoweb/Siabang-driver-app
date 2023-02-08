// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
// Search address map
import 'package:siabang_driver_app/pages/services/data_information_equipment_page.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/button/button_outline.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';
import 'package:siabang_driver_app/widgets/customTextField/custom_input_text.dart';

import '../../../constant/theme.dart';

class DataSenderIntercityPage extends StatefulWidget {
  final bool fromEdit;
  const DataSenderIntercityPage({Key? key, this.fromEdit = false})
      : super(key: key);

  @override
  State<DataSenderIntercityPage> createState() =>
      _DataSenderIntercityPageState();
}

class _DataSenderIntercityPageState extends State<DataSenderIntercityPage> {
  TextEditingController cReceiverName = TextEditingController();
  TextEditingController cReceiverPhone = TextEditingController();
  TextEditingController cReceiverAddress = TextEditingController();
  TextEditingController cReceiverDistrict = TextEditingController();
  TextEditingController cReceiverCity = TextEditingController();
  TextEditingController cReceiverZipCode = TextEditingController();
  bool isFromMaps = false;
  bool saveThisAddress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Data pengirim",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInputText(
                title: "Nama penerima",
                controller: cReceiverName,
                hintText: "Nama lengkap",
              ),
              SizedBox(height: 16),
              CustomInputText(
                preffixWidget: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "+62",
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            color: blackColor,
                          ),
                        ),
                        Container(
                          height: 20,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: VerticalDivider(
                            color: spaceCadet,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                title: "No handphone penerima",
                suffixWidget: Icon(
                  Icons.contact_page_outlined,
                  color: Colors.black,
                ),
                controller: cReceiverPhone,
                inputType: TextInputType.number,
                hintText: "xxx xxx xxx",
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Divider(thickness: 2, height: 0),
              ),
              isFromMaps
                  ? Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10),
                            child: Row(
                              children: [
                                Expanded(child: Text("Titik lokasi")),
                                Image.asset(
                                  icEdit,
                                  width: 20.w,
                                  height: 20.h,
                                ),
                                SizedBox(width: 8),
                                Image.asset(
                                  icDelete,
                                  width: 20.w,
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 2, height: 0),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10),
                            child: Row(
                              children: [
                                Text("Bandung Kulon, Kota Bandung, Jawa Barat"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        CustomInputText(
                          title: "Alamat penerima",
                          controller: cReceiverAddress,
                          hintText: "Detail alamat",
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Alamat lengkap, RT RW, patokan rumah",
                          style: primaryTextStyle.copyWith(
                            fontSize: 12,
                            color: greyColor,
                          ),
                        ),
                        SizedBox(height: 16),
                        CustomInputText(
                          title: "Kecamatan",
                          controller: cReceiverDistrict,
                          hintText: "Kecamatan",
                        ),
                        SizedBox(height: 16),
                        CustomInputText(
                          title: "Kabupaten/Kota",
                          controller: cReceiverCity,
                          hintText: "Kabupaten/Kota",
                        ),
                      ],
                    ),
              SizedBox(height: 8),
              CustomInputText(
                title: "Kode POS",
                controller: cReceiverZipCode,
                inputType: TextInputType.number,
                hintText: "00000",
              ),
              SizedBox(height: 8),
              InkWell(
                onTap: () async {
                  // tambahin nextscreen
                  final res = await null;
                  if (res != null) {
                    isFromMaps = res;
                    setState(() {});
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.map_outlined,
                      color: midnightBlue,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Cari alamat di map ",
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        color: midnightBlue,
                      ),
                    ),
                    Text(
                      " (opsional)",
                      style: primaryTextStyle.copyWith(
                        fontSize: 10,
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      value: saveThisAddress,
                      onChanged: (value) {
                        saveThisAddress = !saveThisAddress;
                        setState(() {});
                      }),
                  Text(
                    "Simpan alamat ini",
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      color: blackColor,
                    ),
                  )
                ],
              ),
              widget.fromEdit
                  ? Row(
                      children: [
                        Expanded(
                          child: ButtonOutline(
                            title: "Batalkan",
                            onTap: () {
                              backScreen();
                            },
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: ButtonPrimary(
                            title: "Simpan",
                            onTap: () {
                              backScreen();
                            },
                          ),
                        )
                      ],
                    )
                  : ButtonPrimary(
                      title: "Selanjutnya",
                      onTap: () {
                        nextScreen(DataInformationEquipmentPage());
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
