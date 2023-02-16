import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:siabang_driver_app/constant/images.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/domain/commons/widgets/row_text.dart';
import 'package:siabang_driver_app/pages/dashboard/widget/summary_daily_task_card.dart';
import 'package:siabang_driver_app/pages/dashboard/widget/total_widget_card.dart';
import 'package:siabang_driver_app/pages/uang_cod/uang_cod_page.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';
import 'package:siabang_driver_app/widgets/modals/modal_date_picker.dart';
import 'package:siabang_driver_app/widgets/modals/modal_month_picker.dart';
import 'package:siabang_driver_app/widgets/modals/modal_urutkan.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var date = DateTime.now();

  final DateFormat formatter = DateFormat("dd-MMMM-yyyy");
  List items = [];
  final ScrollController _scrollController = ScrollController();
  int _currentMax = 10;

  @override
  void initState() {
    items = List.generate(5, (index) => const SummaryDailyTaskCard());
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  _getMoreData() {
    for (items.length = _currentMax;
        items.length < _currentMax;
        items.length++) {
      items.add(items.length + 1);
    }
    _currentMax = _currentMax;

    setState(() {});
  }

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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TotalWidgetCard(
                    height: 84,
                    title: 'Total jam kerja',
                    subtitle: '1287',
                    titleStyle: primaryTextStyle.copyWith(
                      fontSize: 12,
                      color: whiteColor.withOpacity(0.5),
                    ),
                    subtitleStyle: primaryTextStyle.copyWith(
                      color: whiteColor,
                      fontWeight: semiBold,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TotalWidgetCard(
                    height: 84,
                    title: 'Total tugas masuk',
                    subtitle: '401',
                    titleStyle: primaryTextStyle.copyWith(
                      fontSize: 12,
                      color: whiteColor.withOpacity(0.5),
                    ),
                    subtitleStyle: primaryTextStyle.copyWith(
                      color: whiteColor,
                      fontWeight: semiBold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TotalWidgetCard(
                    height: 84,
                    title: 'Total tugas selesai',
                    subtitle: '345',
                    titleStyle: primaryTextStyle.copyWith(
                      fontSize: 12,
                      color: whiteColor.withOpacity(0.5),
                    ),
                    subtitleStyle: primaryTextStyle.copyWith(
                      color: whiteColor,
                      fontWeight: semiBold,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TotalWidgetCard(
                    height: 84,
                    title: 'Total tugas ditolak',
                    subtitle: '56',
                    titleStyle: primaryTextStyle.copyWith(
                      fontSize: 12,
                      color: whiteColor.withOpacity(0.5),
                    ),
                    subtitleStyle: primaryTextStyle.copyWith(
                      color: whiteColor,
                      fontWeight: semiBold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget content() {
    return Container(
      margin: const EdgeInsets.only(
        top: 230,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    date = DateTime(
                      date.year,
                      date.month - 1,
                    );
                    setState(() {});
                  },
                  child: const Icon(Icons.chevron_left),
                ),
                InkWell(
                  onTap: () {
                    ModalMonthPicker.show(context);
                  },
                  child: Text(
                    DateFormat('MMMM yyyy').format(date),
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                      date = DateTime(
                        date.year,
                        date.month + 1,
                      );
                      setState(() {});
                    },
                    child: const Icon(Icons.chevron_right)),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: screenWidth(context),
              height: 42,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: spaceCadet.withOpacity(0.04)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RowText(
                  text1: 'Jam Kerja',
                  text2: '120',
                  textStyle2: primaryTextStyle.copyWith(
                    color: blackColor,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TotalWidgetCard(
                    backgroundColor: spaceCadet.withOpacity(0.04),
                    title: 'Tugas masuk',
                    subtitle: '98',
                    subtitleStyle: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                      color: blackColor,
                    ),
                    titleStyle: primaryTextStyle.copyWith(
                      color: spaceCadet.withOpacity(0.5),
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TotalWidgetCard(
                    backgroundColor: spaceCadet.withOpacity(0.04),
                    title: 'Tugas selesai',
                    subtitle: '80',
                    subtitleStyle: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                      color: blackColor,
                    ),
                    titleStyle: primaryTextStyle.copyWith(
                      color: spaceCadet.withOpacity(0.5),
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TotalWidgetCard(
                    backgroundColor: spaceCadet.withOpacity(0.04),
                    title: 'Tugas ditolak',
                    subtitle: '19',
                    subtitleStyle: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                      color: blackColor,
                    ),
                    titleStyle: primaryTextStyle.copyWith(
                      color: spaceCadet.withOpacity(0.5),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: ListView.builder(
                itemExtent: 177,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length + 1,
                itemBuilder: (context, index) {
                  if (index == items.length && items.length != _currentMax) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const SummaryDailyTaskCard();
                },
                shrinkWrap: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonFilter() {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 3),
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ButtonPrimary(
              icon: Container(
                width: 24,
                height: 24,
                child: Image(
                  image: AssetImage(icSortir),
                  color: whiteColor,
                ),
              ),
              title: 'Urutkan',
              onTap: () {
                ModalUrutkanTask.show(context);
              },
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: ButtonPrimary(
              icon: Container(
                width: 24,
                height: 24,
                child: Image(
                  image: AssetImage(icFilter),
                  color: whiteColor,
                ),
              ),
              title: 'Filter',
              onTap: () {
                ModalFilterTask.show(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPrimary(
        title: 'Dashboard',
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            header(),
            content(),
          ],
        ),
      ),
      bottomNavigationBar: buttonFilter(),
    );
  }
}
