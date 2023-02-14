// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
// Tambahin Sukses order page
import 'package:siabang_driver_app/domain/commons/widgets/row_text.dart';
import 'package:siabang_driver_app/pages/task/widget/item_address_order.dart';
import 'package:siabang_driver_app/pages/services/data_information_equipment_page.dart';
import 'package:siabang_driver_app/pages/services/service_intercity/data_receiver_intercity_page.dart';
import 'package:siabang_driver_app/pages/services/service_intercity/data_sender_intercity_page.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/button/button_outline.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';
// Tambahkn modal delivery kurir
import 'package:siabang_driver_app/widgets/task/item_draft_order.dart';

import '../../constant/theme.dart';
import '../../domain/commons/success_order_page.dart';
import '../../widgets/modals/modal_delivery_courier.dart';

class DetailFormOrderPage extends StatefulWidget {
  const DetailFormOrderPage({Key? key}) : super(key: key);

  @override
  State<DetailFormOrderPage> createState() => _DetailFormOrderPageState();
}

class _DetailFormOrderPageState extends State<DetailFormOrderPage> {
  int itemCount = 1;
  String? armadaSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Detail orderan",
        color: Theme.of(context).scaffoldBackgroundColor,
        status: "Pengiriman dalam kota",
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Alamat",
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 16),
                      Icon(Icons.circle_outlined,
                          color: crimsonColor, size: 20),
                      Image.asset(
                        icDividerVert,
                        height: screenWidth(context) / 2,
                      ),
                      Icon(Icons.circle_outlined,
                          color: crimsonColor, size: 20),
                    ],
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        ItemAddressOrderPage(
                          title: "Penjemputan dari",
                          name: "John Doe",
                          phone: "+62 1237123124",
                          address:
                              "Bandung Kulon, Kota Bandung, Jawa Barat 40123",
                          note: "Jalan depan indomart",
                          onEditTap: () {
                            nextScreen(DataSenderIntercityPage(fromEdit: true));
                          },
                        ),
                        SizedBox(height: 16),
                        ItemAddressOrderPage(
                          title: "Pengiriman ke",
                          name: "Jane Doe",
                          phone: "+62 12312412",
                          address:
                              "Bandung Kulon, Kota Bandung, Jawa Barat 40123",
                          onEditTap: () {
                            nextScreen(
                                DataReceiverIntercityPage(fromEdit: true));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "Daftar Orderan",
                style: primaryTextStyle.copyWith(
                  fontWeight: bold,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                itemCount: itemCount,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: ItemDraftOrder(
                      onEdit: () {
                        nextScreen(
                          DataInformationEquipmentPage(fromEdit: true),
                        );
                      },
                      onDelete: () {
                        if (itemCount > 1) {
                          itemCount--;
                        }
                        setState(() {});
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              ButtonOutline(
                title: "+ Tambah barang",
                onTap: () async {
                  final res = await nextScreen(
                    DataInformationEquipmentPage(fromEdit: true),
                  );
                  if (res == true) {
                    itemCount++;
                    setState(() {});
                  }
                },
              ),
              SizedBox(height: 16),
              Divider(thickness: 2),
              SizedBox(height: 16),
              Text(
                "Armada Penjemputan",
                style: primaryTextStyle.copyWith(
                  fontWeight: bold,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 14),
              InkWell(
                onTap: () async {
                  final res = await ModalDeliveryCourier.show(
                    context,
                    initialValue: armadaSelected,
                    outOfTown: false,
                  );
                  if (res is String) {
                    armadaSelected = res;
                    setState(() {});
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor, width: 2),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Pilih armada penjemputan",
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          color: blackColor,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Visibility(
                visible: armadaSelected != null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth(context),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: greyColor.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Motor (Rp80.000)",
                            style: primaryTextStyle.copyWith(
                              color: blackColor,
                            ),
                          ),
                          Text(
                            "Dimensi: 40 kg",
                            style: primaryTextStyle.copyWith(
                              fontSize: 13,
                              color: greyColor,
                            ),
                          ),
                          Text(
                            "Berat max : 20 x 40 x 30 cm",
                            style: primaryTextStyle.copyWith(
                              fontSize: 13,
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.info_outline, color: midnightBlue, size: 20),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Estimasi penjemputan paket dilokasi anda sekitar 10 menit setelah anda menyelesaikan proses ini",
                            style: primaryTextStyle.copyWith(
                              fontSize: 12,
                              color: greyColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Biaya",
                style: primaryTextStyle.copyWith(
                  fontWeight: bold,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 16),
              RowText(text1: "Biaya pengiriman", text2: "Rp 0"),
              RowText(text1: "Asuransi", text2: "Rp 120.000"),
              RowText(
                text1: "Total",
                text2: "Rp 120.000",
                textStyle1: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                  color: blackColor,
                ),
                textStyle2: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 16),
              ButtonPrimary(
                title: "Lanjutkan",
                onTap: () {
                  backScreenUntil();
                  nextScreen(SuccessOrderPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
