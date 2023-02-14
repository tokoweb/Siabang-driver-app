import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/task/task_dalam_kota/detail_task_dalam_kota.dart';
import 'package:siabang_driver_app/pages/task/task_jemput_dilokasi/detail_task_pick_up.dart';
import 'package:siabang_driver_app/widgets/button/custom_button.dart';
import 'package:siabang_driver_app/widgets/task/task_page.dart';

import '../../pages/task/task_deliver_packages/detail_task_deliver_packages_page.dart';
import '../../pages/task/task_luar_kota/detail_task_luar_kota.dart';

class ItemOrder extends StatefulWidget {
  final STATUSORDER statusOrder;
  final Function() onTap;
  const ItemOrder(
      {Key? key, required this.onTap, this.statusOrder = STATUSORDER.CANCELED})
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
                      "Kode Booking",
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        color: greyColor,
                      ),
                    ),
                    Text(
                      "98762589276160",
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
                          switch (widget.statusOrder) {
                            case STATUSORDER.PENDING:
                              return const Color(0xffE9C030);
                            case STATUSORDER.ONPROGRESS:
                              return const Color(0xff258BD4);
                            case STATUSORDER.COMPlETED:
                              return Colors.green;
                            case STATUSORDER.NEW:
                              return const Color(0xff08B6C1);
                            case STATUSORDER.NEWOUTOFTOWN:
                              return const Color(0xff08B6C1);
                            case STATUSORDER.CANCELED:
                              return Colors.orange;
                            case STATUSORDER.REJECTED:
                              return Colors.red;
                            case STATUSORDER.PICKUP:
                              return const Color(0xff08B6C1);
                            case STATUSORDER.DELIVERPACKAGES:
                              break;
                          }
                        }(),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        () {
                          switch (widget.statusOrder) {
                            case STATUSORDER.PENDING:
                              return "pending";
                            case STATUSORDER.ONPROGRESS:
                              return "Berlangsung";
                            case STATUSORDER.NEW:
                              return "Baru";
                            case STATUSORDER.COMPlETED:
                              return "Selesai";
                            case STATUSORDER.CANCELED:
                              return "Dibatalkan";
                            case STATUSORDER.NEWOUTOFTOWN:
                              return 'Baru';
                            case STATUSORDER.PICKUP:
                              return 'Baru';
                            case STATUSORDER.REJECTED:
                              return 'ditolak';
                            case STATUSORDER.DELIVERPACKAGES:
                              return '';
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
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(thickness: 2),
            ...[
              Container(
                child: () {
                  switch (widget.statusOrder) {
                    case STATUSORDER.PENDING:
                      return const PendingBody();
                    case STATUSORDER.ONPROGRESS:
                      return const ShippedBody();
                    case STATUSORDER.COMPlETED:
                      return const CompletedBody();
                    case STATUSORDER.CANCELED:
                      return const CompletedBody();
                    case STATUSORDER.PICKUP:
                      return const NewBodyPickUp();
                    case STATUSORDER.NEW:
                      return const NewBodyInTheTown();
                    case STATUSORDER.REJECTED:
                      return const RejectedBody();
                    case STATUSORDER.NEWOUTOFTOWN:
                      return const NewBodyOutOfTown();
                    case STATUSORDER.DELIVERPACKAGES:
                      return const DeliverPackagesBody();
                  }
                }(),
              ),
            ],
            const SizedBox(height: 10),
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
          "Penjemputan dari",
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
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1.5,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: CustomButton(
              margin: const EdgeInsets.only(
                top: 30,
              ),
              title: 'Antar ke lokasi',
              textColor: whiteColor,
              bgColor: const Color(0xff6975DC),
              onPressed: () {}),
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
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1.5,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: CustomButton(
              margin: const EdgeInsets.only(
                top: 30,
              ),
              title: 'Jemput di lokasi & kirim',
              textColor: whiteColor,
              bgColor: const Color(0xff08B6C1),
              onPressed: () {}),
        ),
      ],
    );
  }
}

class PendingBody extends StatelessWidget {
  const PendingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
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
                "Pengiriman luar kota",
                style: primaryTextStyle.copyWith(
                  fontSize: 10,
                  color: blackColor,
                ),
              ),
              const Spacer(),
              Text(
                "Jakarta",
                style: primaryTextStyle.copyWith(
                  fontSize: 10.sp,
                  fontWeight: semiBold,
                  color: blackColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Penjemputan dari",
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
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1.5,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: CustomButton(
              margin: const EdgeInsets.only(
                top: 30,
              ),
              title: 'Jemput di lokasi',
              textColor: whiteColor,
              bgColor: const Color(0xff258BD4),
              onPressed: () {}),
        ),
      ],
    );
  }
}

class NewBodyPickUp extends StatelessWidget {
  const NewBodyPickUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
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
                  fontSize: 10.sp,
                  fontWeight: semiBold,
                  color: blackColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Penjemputan dari",
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
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1.5,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: CustomButton(
            margin: const EdgeInsets.only(
              top: 30,
            ),
            title: 'Jemput di lokasi',
            textColor: whiteColor,
            bgColor: const Color(0xff258BD4),
            onPressed: () {
              nextScreen(const DetailTaskPickUpPage());
            },
          ),
        ),
      ],
    );
  }
}

class NewBodyInTheTown extends StatelessWidget {
  const NewBodyInTheTown({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
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
                  fontSize: 10.sp,
                  fontWeight: semiBold,
                  color: blackColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Penjemputan dari ",
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
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1.5,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: CustomButton(
            margin: const EdgeInsets.only(
              top: 30,
            ),
            title: 'Jemput di lokasi & kirim',
            textColor: whiteColor,
            bgColor: const Color(0xff08B6C1),
            onPressed: () {
              nextScreen(const DetailTaskDalamKotaPage());
            },
          ),
        ),
      ],
    );
  }
}

class NewBodyOutOfTown extends StatelessWidget {
  const NewBodyOutOfTown({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
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
                "Pengiriman luar kota",
                style: primaryTextStyle.copyWith(
                  fontSize: 10,
                  color: blackColor,
                ),
              ),
              const Spacer(),
              Text(
                "Yogyakarta",
                style: primaryTextStyle.copyWith(
                  fontSize: 10.sp,
                  fontWeight: semiBold,
                  color: blackColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Pengiriman  ke",
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
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1.5,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: CustomButton(
            margin: const EdgeInsets.only(
              top: 30,
            ),
            title: 'Kirim',
            textColor: whiteColor,
            bgColor: const Color(0xffF49D36),
            onPressed: () {
              nextScreen(const DetailTaskLuarKotaPage());
            },
          ),
        ),
      ],
    );
  }
}

class RejectedBody extends StatelessWidget {
  const RejectedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
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
                "Pengiriman luar kota",
                style: primaryTextStyle.copyWith(
                  fontSize: 10,
                  color: blackColor,
                ),
              ),
              const Spacer(),
              Text(
                "Yogyakarta",
                style: primaryTextStyle.copyWith(
                  fontSize: 10.sp,
                  fontWeight: semiBold,
                  color: blackColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Pengiriman ke ",
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
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1.5,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: CustomButton(
              margin: const EdgeInsets.only(
                top: 30,
              ),
              title: 'Kirim',
              textColor: whiteColor,
              bgColor: const Color(0xffF49D36),
              onPressed: () {}),
        ),
      ],
    );
  }
}

class DeliverPackagesBody extends StatelessWidget {
  const DeliverPackagesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(icTransit),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: screenWidth(context) / 1.42,
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
                      fontSize: 10.sp,
                      fontWeight: semiBold,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Penjemputan dari",
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
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1.5,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: CustomButton(
            margin: const EdgeInsets.only(
              top: 30,
            ),
            title: 'Antar ke lokasi',
            textColor: whiteColor,
            bgColor: const Color(0xff6975DC),
            onPressed: () {
              nextScreen(const DetailTaskDeliverPackagesPage());
            },
          ),
        ),
      ],
    );
  }
}
