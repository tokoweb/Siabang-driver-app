import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';

import '../../constant/theme.dart';

class TermConditionPage extends StatefulWidget {
  const TermConditionPage({Key? key}) : super(key: key);

  @override
  State<TermConditionPage> createState() => _TermConditionPageState();
}

class _TermConditionPageState extends State<TermConditionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Syarat dan ketentuan",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lorem ipsum",
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: bold,
                color: blackColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Lorem ipsum dolor sit amet, set et du consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                color: blackColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Lorem ipsum",
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: bold,
                color: blackColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Lorem ipsum dolor sit amet, set et du consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                color: blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
