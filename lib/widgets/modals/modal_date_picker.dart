import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';

class ModalFilterTask {
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
      enableDrag: true,
      isScrollControlled: true,
      builder: (_) {
        return const FilterCommissionModalView();
      },
    );
  }
}

class FilterCommissionModalView extends StatefulWidget {
  const FilterCommissionModalView({super.key});

  @override
  State<FilterCommissionModalView> createState() =>
      _FilterCommissionModalViewState();
}

class _FilterCommissionModalViewState extends State<FilterCommissionModalView> {
  List<DateTime?> listDate = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      child: Column(
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
                    borderRadius:
                        const BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "Filter",
            style: primaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 10),
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.range,
              calendarViewMode: DatePickerMode.day,
              selectedDayHighlightColor: midnightBlue,
              weekdayLabelTextStyle: primaryTextStyle.copyWith(
                fontWeight: bold,
              ),
              yearBorderRadius: BorderRadius.circular(8),
            ),
            initialValue: listDate,
            onValueChanged: (value) {
              listDate = value;
              setState(() {});
            },
          ),
          ButtonPrimary(
            title: "Terapkan",
            onTap: () {
              backScreen(listDate);
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
