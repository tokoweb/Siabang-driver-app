import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siabang_driver_app/pages/chat/help_page.dart';
import 'package:siabang_driver_app/pages/home_page.dart';
import 'package:siabang_driver_app/pages/main_view_provider.dart';
import 'package:siabang_driver_app/pages/profile/profile_page.dart';
import 'package:siabang_driver_app/pages/task/task_page.dart';

import '../../constant/export_constant.dart';
import '../constant/theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final mainViewProv = context.watch<MainViewProvider>();
    return Scaffold(
      body: () {
        switch (mainViewProv.currentPage) {
          case 0:
            return const HomePage();
          case 1:
            return const TaskPage();
          case 2:
            return const HelpPage();
          default:
            return const ProfilePage();
        }
      }(),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: List.generate(4, (index) {
              return Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: screenWidth(context),
                  height: 3,
                  color: mainViewProv.currentPage == index
                      ? midnightBlue
                      : greyColor.withOpacity(0.5),
                ),
              );
            }).toList(),
          ),
          ...[
            Container(
              child: () {
                final currentPage = mainViewProv.currentPage;
                return BottomAppBar(
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    onTap: (value) {
                      mainViewProv.setPage(value);
                    },
                    unselectedLabelStyle: primaryTextStyle.copyWith(
                      fontSize: 12,
                      color: blackColor,
                    ),
                    selectedLabelStyle: primaryTextStyle.copyWith(
                        fontSize: 12, fontWeight: bold),
                    selectedItemColor: midnightBlue,
                    currentIndex: currentPage,
                    items: [
                      BottomNavigationBarItem(
                        icon: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Image.asset(
                            currentPage == 0
                                ? 'assets/icons/ic_home_selected.png'
                                : 'assets/icons/ic_home.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        label: "Beranda",
                      ),
                      BottomNavigationBarItem(
                        icon: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Image.asset(
                            currentPage == 1 ? icTaskSelected : icTask,
                            width: 24,
                            height: 24,
                          ),
                        ),
                        label: "Tugas",
                      ),
                      BottomNavigationBarItem(
                        icon: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Image.asset(
                            currentPage == 2 ? icHelpSelected : icHelp,
                            width: 24,
                            height: 24,
                          ),
                        ),
                        label: "Bantuan",
                      ),
                      BottomNavigationBarItem(
                        icon: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Image.asset(
                            currentPage == 3 ? icProfileSelected : icProfile,
                            width: 24,
                            height: 24,
                          ),
                        ),
                        label: "Profile",
                      ),
                    ],
                  ),
                );
              }(),
            )
          ]
        ],
      ),
    );
  }
}
