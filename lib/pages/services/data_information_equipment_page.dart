// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/domain/commons/widgets/data_photo.dart';
import 'package:siabang_driver_app/pages/task/detail_form_order_page.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/button/button_outline.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';
import 'package:siabang_driver_app/widgets/modals/modal_image_picker.dart';
import 'package:siabang_driver_app/widgets/customTextField/custom_input_text.dart';

import '../../constant/theme.dart';

class DataInformationEquipmentPage extends StatefulWidget {
  final bool fromEdit;
  const DataInformationEquipmentPage({Key? key, this.fromEdit = false})
      : super(key: key);

  @override
  State<DataInformationEquipmentPage> createState() =>
      _DataInformationEquipmentPageState();
}

class _DataInformationEquipmentPageState
    extends State<DataInformationEquipmentPage> {
  TextEditingController cReceiverName = TextEditingController();
  TextEditingController cReceiverPhone = TextEditingController();
  TextEditingController cReceiverAddress = TextEditingController();
  TextEditingController cReceiverDistrict = TextEditingController();
  TextEditingController cReceiverCity = TextEditingController();
  TextEditingController cReceiverZipCode = TextEditingController();
  bool isUsingInssurance = false;
  String? categorySelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Informasi barang",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kategori barang",
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  color: greyColor,
                ),
              ),
              SizedBox(height: 8),
              InkWell(
                onTap: () async {
                  // Tambahin modal category
                  final res = await null;
                  if (res != null) {
                    categorySelected = res;
                    setState(() {});
                  }
                },
                child: Container(
                  width: screenWidth(context),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Pilih kategori",
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                          color: greyColor,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              CustomInputText(
                title: "Deskripsi barang",
                controller: cReceiverPhone,
                maxLines: 3,
                hintText: "Deskripsi barang",
              ),
              SizedBox(height: 4),
              Text(
                "Baju, kulkas, lemari, dll",
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  color: blackColor,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Divider(thickness: 2, height: 0),
              ),
              SizedBox(height: 16),
              CustomInputText(
                title: "Estimasi berat barang",
                controller: cReceiverAddress,
                inputType: TextInputType.number,
                hintText: "0",
                suffixWidget: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Kg",
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            color: greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Dimensi barang",
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  color: blackColor,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomInputText(
                      title: "Panjang",
                      controller: cReceiverDistrict,
                      inputType: TextInputType.number,
                      hintText: "0",
                      suffixWidget: IntrinsicHeight(
                        child: Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "cm",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16,
                                  color: greyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: CustomInputText(
                      title: "Lebar",
                      controller: cReceiverDistrict,
                      inputType: TextInputType.number,
                      hintText: "0",
                      suffixWidget: IntrinsicHeight(
                        child: Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "cm",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16,
                                  color: greyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: CustomInputText(
                      title: "Tinggi",
                      controller: cReceiverDistrict,
                      inputType: TextInputType.number,
                      hintText: "0",
                      suffixWidget: IntrinsicHeight(
                        child: Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "cm",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16,
                                  color: greyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "Foto barang",
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  DataPhoto(onTap: () {
                    ModalImagePicker.show(context, () {});
                  }),
                  SizedBox(width: 10),
                  DataPhoto(onTap: () {
                    ModalImagePicker.show(context, () {});
                  }),
                  SizedBox(width: 10),
                  DataPhoto(onTap: () {
                    ModalImagePicker.show(context, () {});
                  }),
                  SizedBox(width: 10),
                  DataPhoto(onTap: () {
                    ModalImagePicker.show(context, () {});
                  }),
                ],
              ),
              InkWell(
                onTap: () async {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      activeColor: midnightBlue,
                      value: isUsingInssurance,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      onChanged: (value) {
                        isUsingInssurance = !isUsingInssurance;
                        setState(() {});
                      },
                    ),
                    Text(
                      "Gunakan asuransi pengiriman",
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isUsingInssurance,
                child: CustomInputText(
                  isCurrency: true,
                  title: "Masukan harga barang",
                  controller: cReceiverPhone,
                  inputType: TextInputType.number,
                  hintText: "0",
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
                              backScreen(true);
                            },
                          ),
                        )
                      ],
                    )
                  : ButtonPrimary(
                      title: "Selanjutnya",
                      onTap: () {
                        nextScreen(DetailFormOrderPage());
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
