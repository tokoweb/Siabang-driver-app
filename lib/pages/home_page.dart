import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:siabang_driver_app/constant/images.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/dashboard/dashboard_page.dart';
import 'package:siabang_driver_app/pages/notif/notif_page.dart';
import 'package:siabang_driver_app/pages/uang_cod/uang_cod_page.dart';
import 'package:siabang_driver_app/widgets/button/custom_button.dart';
import 'package:siabang_driver_app/widgets/modals/modal_search_order.dart';
import 'package:siabang_driver_app/widgets/modals/modal_stop_work.dart';
import 'package:siabang_driver_app/widgets/task/task_page.dart';

import '../widgets/task/item_order.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final now = DateTime.now();
  final DateFormat formatter = DateFormat("dd-MMMM-yyyy");
  bool tap = false;
  bool? onClick;
  List<STATUSORDER> items = [
    STATUSORDER.NEW,
    STATUSORDER.PICKUP,
    STATUSORDER.NEWOUTOFTOWN,
    STATUSORDER.DELIVERPACKAGES,
  ];

  Widget buttonUangCod() {
    return ElevatedButton(
      onPressed: () {
        nextScreen(const UangCodPage());
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: aliceBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        backgroundColor: const Color(
          0xff1C2F72,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            icRp,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'Uang Cod',
            style: primaryTextStyle.copyWith(
              color: whiteColor.withOpacity(
                0.7,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      height: 450,
      decoration: BoxDecoration(
        color: midnightBlue,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Container(
          margin: const EdgeInsets.only(
            top: 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    typoLogo,
                    width: 180,
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      nextScreen(const NotificationPage());
                    },
                    child: Image.asset(
                      icBell,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 19,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            ppImages,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Halo,',
                        style: primaryTextStyle.copyWith(
                          color: whiteColor.withOpacity(
                            0.7,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Arya Kurniawan',
                        style: primaryTextStyle.copyWith(
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  buttonUangCod(),
                ],
              ),
              kerja(),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget kerja() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 24,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff1C2F72),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 18,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Siap bekerja hari ini ?',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    color: whiteColor.withOpacity(
                      0.7,
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      DateFormat('dd MMMM yyyy').format(now),
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        color: whiteColor.withOpacity(
                          0.7,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    InkWell(
                      onTap: () {
                        nextScreen(const DashboardPage());
                      },
                      child: Image.asset(
                        icArrow,
                        width: 5,
                        height: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            onClick == tap
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: whiteColor.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        width: 260,
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            top: 12,
                          ),
                          child: Text(
                            '5 Jam 28 Menit',
                            style: primaryTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 18,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            ModalStopWork.show(context);
                          });
                        },
                        child: const Image(
                          width: 46,
                          height: 46,
                          image: AssetImage(icStop),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                : CustomButton(
                    margin: const EdgeInsets.only(
                      top: 14,
                    ),
                    title: 'Mulai bekerja',
                    textColor: whiteColor,
                    bgColor: crimsonColor,
                    onPressed: () {
                      setState(() {
                        onClick = false;
                        onClick == tap;
                      });
                    })
          ],
        ),
      ),
    );
  }

  Widget emptyContent() {
    return Container(
      margin: const EdgeInsets.only(
        top: 330,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            30,
          ),
          topRight: Radius.circular(
            30,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              'Orderan Masuk',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    icBox,
                    width: 141,
                    height: 141,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Belum ada orderan yang\nmasuk hari ini',
                    textAlign: TextAlign.center,
                    style: primaryTextStyle.copyWith(
                      color: spaceCadet,
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

  Widget content() {
    return Container(
      margin: const EdgeInsets.only(
        top: 330,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            30,
          ),
          topRight: Radius.circular(
            30,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              'Orderan Masuk (8)',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            Center(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemOrder(
                    statusOrder: items[index],
                    onTap: () {},
                  );
                },
                shrinkWrap: true,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: driverButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget driverButton() {
    return InkWell(
      onTap: () {
        SearchOrder.show(context);
      },
      child: Container(
        width: 60,
        height: 60,
        margin: const EdgeInsets.only(
          top: 20,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              icDriver,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            header(),
            content(),
          ],
        ),
      ),
    );
  }
}
