import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:siabang_driver_app/constant/images.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/notif/notif_page.dart';
import 'package:siabang_driver_app/widgets/button/custom_button.dart';
import 'package:siabang_driver_app/widgets/modals/modal_stop_work.dart';
import 'package:siabang_driver_app/widgets/task/orderan_masuk_card.dart';

import '../widgets/task/task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final now = DateTime.now();
  final DateFormat formatter = DateFormat("dd-MMMM-yyyy");
  List<STATUSORDER> items = [
    STATUSORDER.ONPROGRESS,
    STATUSORDER.ONPROGRESS,
    STATUSORDER.ONPROGRESS,
    STATUSORDER.ONPROGRESS,
    STATUSORDER.UNPAID,
    STATUSORDER.COMPlETED,
    STATUSORDER.CANCELED,
    STATUSORDER.CANCELED,
  ];

  Widget buttonUangCod() {
    return Container(
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          children: [
            Image.asset(
              icRp,
              width: 20,
              height: 20,
            ),
            SizedBox(
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
        style: ElevatedButton.styleFrom(
          foregroundColor: aliceBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          backgroundColor: Color(
            0xff1C2F72,
          ),
        ),
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
        margin: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Container(
          margin: EdgeInsets.only(
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
                      nextScreen(NotificationPage());
                    },
                    child: Image.asset(
                      icBell,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 19,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            ppImages,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
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
                      SizedBox(
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
                  Spacer(),
                  buttonUangCod(),
                ],
              ),
              kerja(),
              SizedBox(
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
      margin: EdgeInsets.only(
        top: 24,
      ),
      decoration: BoxDecoration(
        color: Color(0xff1C2F72),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
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
                Spacer(),
                Row(
                  children: [
                    Text(
                      '${DateFormat('dd MMMM yyyy').format(now)}',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        color: whiteColor.withOpacity(
                          0.7,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Image.asset(
                      icArrow,
                      width: 5,
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            CustomButton(
              margin: EdgeInsets.only(
                top: 14,
              ),
              title: 'Mulai bekerja',
              textColor: whiteColor,
              bgColor: crimsonColor,
              onPressed: () {
                ModalStopWork.show(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget emptyContent() {
    return Container(
      margin: EdgeInsets.only(
        top: 330,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            30,
          ),
          topRight: Radius.circular(
            30,
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              'Orderan Masuk',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
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
                  SizedBox(
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
      margin: EdgeInsets.only(
        top: 330,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            30,
          ),
          topRight: Radius.circular(
            30,
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              'Orderan Masuk',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            Center(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemOrder(
                    onTap: () {},
                    statusorder: items[index],
                  );
                },
                shrinkWrap: true,
              ),
            ),
            SizedBox(
              height: 100,
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
    return Container(
      width: 60,
      height: 60,
      margin: EdgeInsets.only(
        top: 60,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            icDriver,
          ),
          fit: BoxFit.cover,
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
