// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
// Search addres map
import 'package:siabang_driver_app/pages/services/service_intercity/data_sender_intercity_page.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/button/button_outline.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';
import 'package:siabang_driver_app/widgets/customTextField/custom_input_text.dart';

import '../../../constant/theme.dart';

class DataReceiverIntercityPage extends StatefulWidget {
  final bool fromEdit;
  const DataReceiverIntercityPage({Key? key, this.fromEdit = false})
      : super(key: key);

  @override
  State<DataReceiverIntercityPage> createState() =>
      _DataReceiverIntercityPageState();
}

class _DataReceiverIntercityPageState extends State<DataReceiverIntercityPage> {
  TextEditingController cReceiverName = TextEditingController();
  TextEditingController cReceiverPhone = TextEditingController();
  TextEditingController cReceiverAddress = TextEditingController();
  TextEditingController cReceiverDistrict = TextEditingController();
  TextEditingController cReceiverCity = TextEditingController();
  TextEditingController cReceiverZipCode = TextEditingController();
  bool isFromMaps = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Data penerima",
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
                                InkWell(
                                  onTap: () async {
                                    // Tambahin nextscreen map
                                    final res = await null;
                                    if (res != null) {
                                      isFromMaps = res;
                                      setState(() {});
                                    }
                                  },
                                  child: Image.asset(
                                    icEdit,
                                    width: 20.w,
                                    height: 20.h,
                                  ),
                                ),
                                SizedBox(width: 8),
                                InkWell(
                                  onTap: () {
                                    isFromMaps = false;
                                    setState(() {});
                                  },
                                  child: Image.asset(
                                    icDelete,
                                    width: 20.w,
                                    height: 20.h,
                                  ),
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
                              fontSize: 12, color: greyColor),
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
                  // Tambahin nextscreen searchmap
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
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
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
                        nextScreen(DataSenderIntercityPage());
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
