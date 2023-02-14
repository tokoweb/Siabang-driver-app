import 'package:flutter/material.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/widgets/task/summary_detail_order_page.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/task/item_order.dart';
import '../../constant/theme.dart';

enum STATUSORDER {
  PENDING,
  ONPROGRESS,
  COMPlETED,
  CANCELED,
  NEW,
  NEWOUTOFTOWN,
  REJECTED,
  PICKUP,
  DELIVERPACKAGES,
}

enum STATUSDRIVER { INIT, ACCEPTEDUNPAID, ACCEPTEDPAID, ARRIVED }

class TaskPage extends StatefulWidget {
  final String? controlTab;
  const TaskPage({super.key, this.controlTab});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  bool isShow = false;
  String tabSelected = "Semua";

  List<STATUSORDER> items = [
    STATUSORDER.NEW,
    STATUSORDER.REJECTED,
    STATUSORDER.COMPlETED,
  ];

  @override
  void initState() {
    super.initState();
    tabSelected = widget.controlTab ?? "Semua";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Orderan",
        color: Theme.of(context).scaffoldBackgroundColor,
        backIsDisable: true,
        leading: InkWell(
          onTap: () {
            Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        "Semua",
                        "Baru",
                        "Menunggu Pembayaran",
                        "Berlangsung",
                        "Pending",
                        "Selesai",
                        "Dibatalkan"
                      ].map((e) {
                        return InkWell(
                          onTap: () {
                            tabSelected = e;
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: tabSelected == e
                                  ? midnightBlue
                                  : greyColor.withOpacity(0.25),
                            ),
                            child: Text(
                              e,
                              style: primaryTextStyle.copyWith(
                                color: tabSelected == e ? whiteColor : null,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  width: screenWidth(context),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: greyColor.withOpacity(0.5),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Total order"),
                                      Text(
                                        "64",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  width: screenWidth(context),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(color: greyColor),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Periode"),
                                      Row(
                                        children: [
                                          Text(
                                            "Oktober",
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: bold,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(Icons.keyboard_arrow_down),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ListView.builder(
                            itemCount: items.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ItemOrder(
                                statusOrder: items[index],
                                onTap: () {
                                  nextScreen(const SummaryDetailOrderPage());
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
