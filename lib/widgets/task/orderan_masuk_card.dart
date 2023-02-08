import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/widgets/task/task_page.dart';

class ItemOrder extends StatefulWidget {
  final STATUSORDER statusorder;
  final Function() onTap;
  const ItemOrder(
      {Key? key, required this.onTap, this.statusorder = STATUSORDER.UNPAID})
      : super(key: key);

  @override
  State<ItemOrder> createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4,
              offset: const Offset(0, 3),
              blurStyle: BlurStyle.outer,
            )
          ],
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: midnightBlue.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    "${pathIcons}ic_book.png",
                    width: 18,
                    height: 18,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "No. Resi",
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        color: greyColor,
                      ),
                    ),
                    Text(
                      "987yhE62w",
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 1),
                      decoration: BoxDecoration(
                        color: () {
                          switch (widget.statusorder) {
                            case STATUSORDER.UNPAID:
                              return Colors.orange[300];
                            case STATUSORDER.ONPROGRESS:
                              return Color(0xff08B6C1);
                            case STATUSORDER.COMPlETED:
                              return Colors.blue;
                            case STATUSORDER.CANCELED:
                              return Colors.red;
                          }
                        }(),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        () {
                          switch (widget.statusorder) {
                            case STATUSORDER.UNPAID:
                              return "Menunggu pembayaran";

                            case STATUSORDER.ONPROGRESS:
                              return "Baru";
                            case STATUSORDER.COMPlETED:
                              return "Selesai";
                            case STATUSORDER.CANCELED:
                              return "Dibatalkan";
                          }
                        }(),
                        style: primaryTextStyle.copyWith(
                          fontSize: 10,
                          color: whiteColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "12 Okt 2022",
                      style: primaryTextStyle.copyWith(
                        fontSize: 10,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(thickness: 1.5),
            Container(
              width: screenWidth(context),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: greyColor.withOpacity(0.25),
              ),
              child: Row(
                children: [
                  Text(
                    "Pengiriman dalam kota",
                    style: primaryTextStyle.copyWith(
                      fontSize: 10,
                      color: blackColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Bandung",
                    style: primaryTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: semiBold,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(thickness: 2),
            ...[
              Container(
                child: () {
                  switch (widget.statusorder) {
                    case STATUSORDER.UNPAID:
                      return const UnpaidBody();
                    case STATUSORDER.ONPROGRESS:
                      return const ShippedBody();
                    case STATUSORDER.COMPlETED:
                      return const CompletedBody();
                    case STATUSORDER.CANCELED:
                      return const CompletedBody();
                  }
                }(),
              ),
            ],
            const SizedBox(height: 10),
            const Divider(thickness: 1.5),
            const SizedBox(height: 10),
            Container(
              width: screenWidth(context),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: greyColor.withOpacity(0.25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Jemput di lokasi",
                    style: primaryTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: semiBold,
                      color: blackColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      "Menunggu penjemputan paket di lokasi",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      style: primaryTextStyle.copyWith(
                        fontSize: 10,
                        color: greyColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompletedBody extends StatelessWidget {
  const CompletedBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pengiriman Ke",
          style: primaryTextStyle.copyWith(
            fontSize: 10,
            color: greyColor,
          ),
        ),
        Text(
          "John Doe (0812314313121)",
          style: primaryTextStyle.copyWith(
            fontSize: 12,
            fontWeight: bold,
            color: blackColor,
          ),
        ),
        Text(
          "Bandung Kulon, Kota Bandung, Jawa Barat",
          style: primaryTextStyle.copyWith(
            fontSize: 12,
            color: blackColor,
          ),
        ),
        Text(
          "40123",
          style: primaryTextStyle.copyWith(
            fontSize: 12,
            color: blackColor,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: greyColor)),
              child: Icon(Icons.notes_sharp, color: greyColor, size: 15),
            ),
            const SizedBox(width: 10),
            Text(
              "Depan jalan samping indomart",
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                color: blackColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ShippedBody extends StatelessWidget {
  const ShippedBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pengiriman Ke",
          style: primaryTextStyle.copyWith(
            fontSize: 10,
            color: greyColor,
          ),
        ),
        Text(
          "John Doe (0812314313121)",
          style: primaryTextStyle.copyWith(
            fontSize: 12,
            fontWeight: bold,
            color: blackColor,
          ),
        ),
        Text(
          "Bandung Kulon, Kota Bandung, Jawa Barat",
          style: primaryTextStyle.copyWith(
            fontSize: 12,
            color: blackColor,
          ),
        ),
        Text(
          "40123",
          style: primaryTextStyle.copyWith(
            fontSize: 12,
            color: blackColor,
          ),
        ),
      ],
    );
  }
}

class UnpaidBody extends StatelessWidget {
  const UnpaidBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pembayaran melalui virtual account",
          style: primaryTextStyle.copyWith(
            fontSize: 10,
            color: greyColor,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 15,
                      width: 25,
                      color: midnightBlue,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Bank BCA",
                      style: primaryTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: semiBold,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kode pembayaran",
                    style: primaryTextStyle.copyWith(
                      fontSize: 10,
                      color: blackColor,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "567890123456789456",
                        style: primaryTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: semiBold,
                          color: blackColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.copy, size: 15),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Batas pembayaran",
                    style: primaryTextStyle.copyWith(
                      fontSize: 10,
                      color: blackColor,
                    ),
                  ),
                  Text(
                    "12 Okt, 20:00",
                    style: primaryTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: semiBold,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total pembayaran",
                    style: primaryTextStyle.copyWith(
                      fontSize: 10,
                      color: greyColor,
                    ),
                  ),
                  Text(
                    "Rp90.000",
                    style: primaryTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: semiBold,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
