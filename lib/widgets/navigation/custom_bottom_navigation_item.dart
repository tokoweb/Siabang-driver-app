import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siabang_driver_app/constant/theme.dart';

import '../../cubit/page_cubit.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  const CustomBottomNavigationItem(
      {super.key,
      required this.iconUrl,
      required this.label,
      required this.index});

  final String iconUrl;
  final String label;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        children: [
          Flexible(
            child: Container(
              width: 108,
              height: 3,
              decoration: BoxDecoration(
                color: context.read<PageCubit>().state == index
                    ? midnightBlue
                    : disableColor,
              ),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Image.asset(
            iconUrl,
            width: 20,
            height: 20,
            color: context.read<PageCubit>().state == index
                ? midnightBlue
                : disableColor,
          ),
          const SizedBox(
            height: 3,
          ),
          Center(
            child: Text(
              label,
              style: primaryTextStyle.copyWith(
                color: context.read<PageCubit>().state == index
                    ? midnightBlue
                    : disableColor,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
