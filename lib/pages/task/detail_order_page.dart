import 'package:flutter/material.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/domain/commons/widgets/row_text.dart';
import 'package:siabang_driver_app/pages/task/widget/item_address_order.dart';
import 'package:siabang_driver_app/pages/services/data_information_equipment_page.dart';
import 'package:siabang_driver_app/pages/services/service_intercity/data_receiver_intercity_page.dart';
import 'package:siabang_driver_app/pages/services/service_intercity/data_sender_intercity_page.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/task/item_draft_order.dart';

import '../../../constant/export_constant.dart';
import '../../constant/theme.dart';

class DetailOrderPage extends StatefulWidget {
  const DetailOrderPage({Key? key}) : super(key: key);

  @override
  State<DetailOrderPage> createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> {
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
                  color: blackColor,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 16),
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
                  const SizedBox(width: 10),
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
                          isEditable: false,
                          onEditTap: () {
                            nextScreen(
                                const DataSenderIntercityPage(fromEdit: true));
                          },
                        ),
                        const SizedBox(height: 16),
                        ItemAddressOrderPage(
                          title: "Pengiriman ke",
                          name: "Jane Doe",
                          phone: "+62 12312412",
                          address:
                              "Bandung Kulon, Kota Bandung, Jawa Barat 40123",
                          isEditable: false,
                          onEditTap: () {
                            nextScreen(const DataReceiverIntercityPage(
                                fromEdit: true));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                "Daftar Orderan",
                style: primaryTextStyle.copyWith(
                  fontWeight: bold,
                  color: blackColor,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: itemCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ItemDraftOrder(
                      isEditable: false,
                      onEdit: () {
                        nextScreen(
                          const DataInformationEquipmentPage(fromEdit: true),
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
              const SizedBox(height: 16),
              const Divider(thickness: 2),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth(context),
                    padding: const EdgeInsets.all(16),
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.info_outline, color: midnightBlue, size: 20),
                      const SizedBox(width: 8),
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
              const SizedBox(height: 16),
              Text(
                "Biaya",
                style: primaryTextStyle.copyWith(
                  fontWeight: bold,
                  color: blackColor,
                ),
              ),
              const SizedBox(height: 16),
              const RowText(text1: "Biaya pengiriman", text2: "Rp0"),
              const RowText(text1: "Asuransi", text2: "Rp120.000"),
              const RowText(text1: "Diskon", text2: "10%"),
              RowText(
                text1: "Total",
                text2: "Rp 120.000",
                textStyle1: primaryTextStyle.copyWith(
                  fontSize: 14,
                  color: blackColor,
                  fontWeight: bold,
                ),
                textStyle2: primaryTextStyle.copyWith(
                  fontSize: 14,
                  color: blackColor,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
