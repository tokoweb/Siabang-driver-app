import 'package:flutter/material.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/domain/commons/widgets/row_text.dart';
import 'package:siabang_driver_app/pages/task/task_dalam_kota/status_task_dalam_kota.dart';
import 'package:siabang_driver_app/pages/task/widget/item_address_order.dart';
import 'package:siabang_driver_app/pages/services/data_information_equipment_page.dart';
import 'package:siabang_driver_app/pages/services/service_intercity/data_receiver_intercity_page.dart';
import 'package:siabang_driver_app/pages/services/service_intercity/data_sender_intercity_page.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/button/button_outline.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';
import 'package:siabang_driver_app/widgets/modals/modal_delivery_courier.dart';
import 'package:siabang_driver_app/widgets/modals/modal_reject_task.dart';
import 'package:siabang_driver_app/widgets/modals/modal_stop_work.dart';
import 'package:siabang_driver_app/widgets/task/item_draft_order.dart';
import 'package:flutter/services.dart';

import '../../../constant/export_constant.dart';
import '../../../constant/theme.dart';
import '../../../widgets/task/task_page.dart';

class DetailTaskDalamKotaPage extends StatefulWidget {
  final STATUSORDER status;
  final STATUSDRIVER statusdriver;
  final bool statusRefund;
  const DetailTaskDalamKotaPage({
    Key? key,
    this.status = STATUSORDER.CANCELED,
    this.statusdriver = STATUSDRIVER.INIT,
    this.statusRefund = false,
  }) : super(key: key);

  @override
  State<DetailTaskDalamKotaPage> createState() =>
      _DetailTaskDalamKotaPageState();
}

class _DetailTaskDalamKotaPageState extends State<DetailTaskDalamKotaPage> {
  int itemCount = 1;
  String? armadaSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Detail orderan",
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF08B6C1),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              "Baru",
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                color: whiteColor,
              ),
            ),
          ),
        ],
        color: Theme.of(context).scaffoldBackgroundColor,
        status: "Pengiriman dalam kota • Jemput di lokasi & kirim",
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
                  Spacer(),
                  Text(widget.status != STATUSORDER.PENDING
                      ? "987yhE62w"
                      : "123456789123456"),
                  SizedBox(width: 10),
                  GestureDetector(
                      onTap: () async {
                        await Clipboard.setData(
                          ClipboardData(
                            text: widget.status != STATUSORDER.NEW
                                ? '987yhE62w'
                                : '123456789123456',
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(
                            seconds: 2,
                          ),
                          content: Text(
                            'Copied',
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: midnightBlue,
                        ));
                      },
                      child: Icon(Icons.copy, size: 16)),
                ],
              ),
              SizedBox(height: 8.h),
              RowText(
                  text1: "Tanggal order", text2: "12 Okt 20222 - 10:32 WIB"),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: Divider(thickness: 2),
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
                padding: EdgeInsets.all(16),
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
                    SizedBox(
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
                    SizedBox(
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
              const Divider(thickness: 2),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ButtonOutline(
                      title: 'Tolak',
                      textStyle: primaryTextStyle.copyWith(color: Colors.red),
                      onTap: () {
                        ModalRejectTask.show(context);
                      },
                      borderColor: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Expanded(
                    child: ButtonPrimary(
                      title: 'Terima',
                      textStyle: primaryTextStyle.copyWith(
                        color: whiteColor,
                      ),
                      color: Color(0xff27AE60),
                      onTap: () {
                        ModalDeliveryCourier.show(
                          context,
                          onTap: () {
                            nextScreen(StatusTaskDalamKotaPage());
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
