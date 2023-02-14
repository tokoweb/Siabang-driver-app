import 'package:flutter/material.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/domain/commons/widgets/row_text.dart';
import 'package:siabang_driver_app/pages/task/widget/item_address_order.dart';
import 'package:siabang_driver_app/pages/services/data_information_equipment_page.dart';
import 'package:siabang_driver_app/pages/services/service_intercity/data_receiver_intercity_page.dart';
import 'package:siabang_driver_app/pages/services/service_intercity/data_sender_intercity_page.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/task/item_draft_order.dart';
import 'package:flutter/services.dart';

import '../../../constant/export_constant.dart';
import '../../../constant/theme.dart';
import '../../../widgets/task/task_page.dart';

class StatusDetailTaskRejectedPage extends StatefulWidget {
  final STATUSORDER status;
  final STATUSDRIVER statusdriver;
  final bool statusRefund;
  const StatusDetailTaskRejectedPage({
    Key? key,
    this.status = STATUSORDER.CANCELED,
    this.statusdriver = STATUSDRIVER.INIT,
    this.statusRefund = false,
  }) : super(key: key);

  @override
  State<StatusDetailTaskRejectedPage> createState() =>
      _StatusDetailTaskRejectedPageState();
}

class _StatusDetailTaskRejectedPageState
    extends State<StatusDetailTaskRejectedPage> {
  int itemCount = 1;
  String? armadaSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        onBack: () {
          backScreenUntil();
        },
        title: "Detail orderan",
        color: Theme.of(context).scaffoldBackgroundColor,
        status: "Pengiriman dalam kota • Jemput di lokasi & kirim",
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: crimsonColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              "ditolak",
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.status != STATUSORDER.PENDING
                        ? "No. Resi"
                        : "Kode booking",
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      color: blackColor,
                    ),
                  ),
                  const Spacer(),
                  Text(widget.status != STATUSORDER.PENDING
                      ? "987yhE62w"
                      : "123456789123456"),
                  const SizedBox(width: 10),
                  GestureDetector(
                      onTap: () async {
                        await Clipboard.setData(
                          ClipboardData(
                            text: widget.status != STATUSORDER.PENDING
                                ? '987yhE62w'
                                : '123456789123456',
                          ),
                        );
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(
                            seconds: 2,
                          ),
                          content: const Text(
                            'Copied',
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: midnightBlue,
                        ));
                      },
                      child: const Icon(Icons.copy, size: 16)),
                ],
              ),
              SizedBox(height: 8.h),
              const RowText(
                  text1: "Tanggal order", text2: "12 Okt 20222 - 10:32 WIB"),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: const Divider(thickness: 2),
              ),
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
                              "Bandung Kulon, Kota Bandung, Jawa Barat\n40123",
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
                              "Bandung Kulon, Kota Bandung, Jawa Barat\n40123",
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
              const SizedBox(
                height: 30,
              ),
              Container(
                width: screenWidth(context),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: greyColor.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    RowText(
                      text1: 'Armada penjemputan',
                      textStyle1: primaryTextStyle.copyWith(
                        color: blackColor,
                      ),
                      text2: 'Motor',
                      textStyle2: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    RowText(
                      text1: 'Metode pembayaran',
                      textStyle1: primaryTextStyle.copyWith(
                        color: blackColor,
                      ),
                      text2: 'Tunai (COD)',
                      textStyle2: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    RowText(
                      text1: 'Total pembayaran',
                      textStyle1: primaryTextStyle.copyWith(
                        color: blackColor,
                      ),
                      text2: 'Rp 90.000',
                      textStyle2: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Informasi barang",
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
            ],
          ),
        ),
      ),
    );
  }
}
