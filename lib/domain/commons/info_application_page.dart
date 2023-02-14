import 'package:flutter/material.dart';

import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';

import '../../constant/theme.dart';

class InfoApplicationPage extends StatefulWidget {
  const InfoApplicationPage({Key? key}) : super(key: key);

  @override
  State<InfoApplicationPage> createState() => _InfoApplicationPageState();
}

class _InfoApplicationPageState extends State<InfoApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Tentang aplikasi",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: midnightBlue.withOpacity(0.15),
                ),
                child: Icon(Icons.photo, color: greyColor, size: 65),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Versi aplikasi",
                style: primaryTextStyle.copyWith(
                  fontWeight: bold,
                  color: greyColor,
                ),
              ),
              Text(
                "10.18.0",
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  color: greyColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Lorem ipsum dolor sit amet, set et du consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  color: blackColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
