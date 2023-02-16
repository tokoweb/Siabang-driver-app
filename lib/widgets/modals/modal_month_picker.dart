import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';

import '../../constant/theme.dart';
import '../task/item_bar_task.dart';

class ModalMonthPicker {
  static Future show(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      backgroundColor: Colors.transparent,
      builder: (_) {
        return const ContinueLiveChatModalView(
          onClick: true,
        );
      },
    );
  }
}

class ContinueLiveChatModalView extends StatefulWidget {
  const ContinueLiveChatModalView({Key? key, required this.onClick})
      : super(key: key);

  final bool onClick;

  @override
  State<ContinueLiveChatModalView> createState() =>
      _ContinueLiveChatModalViewState();
}

class _ContinueLiveChatModalViewState extends State<ContinueLiveChatModalView> {
  var date = DateTime.now();

  final DateFormat formatter = DateFormat("dd-MMMM-yyyy");

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  date = DateTime(
                    date.year - 1,
                  );
                  setState(() {});
                },
                child: const Icon(Icons.chevron_left),
              ),
              Text(
                DateFormat('yyyy').format(date),
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              InkWell(
                  onTap: () {
                    date = DateTime(
                      date.year + 1,
                    );
                    setState(() {});
                  },
                  child: const Icon(Icons.chevron_right)),
            ],
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ButtonPrimary(
                  title: "Terapkan",
                  onTap: () {
                    backScreen();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}

class ItemNonActive extends StatelessWidget {
  final String title;
  const ItemNonActive({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: greyColor.withOpacity(0.5),
      ),
      child: Text(
        title,
        style: primaryTextStyle.copyWith(
          fontSize: 12,
          color: spaceCadet.withOpacity(0.5),
        ),
      ),
    );
  }
}

class ItemActive extends StatelessWidget {
  final String title;
  const ItemActive({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: midnightBlue,
      ),
      child: Text(
        title,
        style: primaryTextStyle.copyWith(
          fontSize: 12,
          color: whiteColor,
        ),
      ),
    );
  }
}

class MonthCardPage extends StatelessWidget {
  final List<String> listBar;
  final int stateIndex;
  final Function(int index) onTap;
  const MonthCardPage(
      {Key? key,
      required this.listBar,
      required this.stateIndex,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
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
