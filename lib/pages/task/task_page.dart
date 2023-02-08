// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/task/status_order_page.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/task/item_bar_task.dart';

import '../../widgets/task/orderan_masuk_card.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  int stateIndex = 0;
  List<String> listBar = [
    "Semua",
    "Berlangsung",
    "Pending",
    "DiTolak",
    "Selesai",
  ];

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

  List<STATUSORDER> bckupItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bckupItems.addAll(items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        backIsDisable: true,
        title: "Tugas",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderOderPage(
            listBar: listBar,
            onTap: (idx) {
              stateIndex = idx;
              setState(() {});
            },
            stateIndex: stateIndex,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemOrder(
                    onTap: () {
                      nextScreen(StatusOrderPage(
                        status: items[index],
                        statusdriver: () {
                          if (index == 1) {
                            return STATUSDRIVER.ACCEPTEDUNPAID;
                          }
                          if (index == 2) {
                            return STATUSDRIVER.ACCEPTEDPAID;
                          }
                          if (index == 3) {
                            return STATUSDRIVER.ARRIVED;
                          }
                          return STATUSDRIVER.INIT;
                        }(),
                        statusRefund: index == (items.length - 1),
                      ));
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderOderPage extends StatelessWidget {
  final List<String> listBar;
  final int stateIndex;
  final Function(int index) onTap;
  const HeaderOderPage(
      {Key? key,
      required this.listBar,
      required this.stateIndex,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: listBar.map((e) {
          final index = listBar.indexWhere((a) => e == a);
          return ItemBarOrder(
            isActive: stateIndex == index,
            title: e,
            onTap: () => onTap(index),
          );
        }).toList()),
      ),
    );
  }
}
