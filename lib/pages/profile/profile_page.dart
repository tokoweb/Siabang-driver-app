// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/pages/auth/login_page.dart';
import 'package:siabang_driver_app/pages/profile/edit_profile_page.dart';
import 'package:siabang_driver_app/pages/profile/sim_info_page.dart';

import '../../domain/commons/info_application_page.dart';
import '../../domain/commons/privacy_policy_page.dart';
import '../../domain/commons/term_condition_page.dart';
import '../../widgets/dialog/general_dialog.dart';
import 'change_password_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: midnightBlue,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 25,
            child: Container(width: 410, child: Image.asset(imWaveBar)),
          ),
          Positioned(
            top: kToolbarHeight * 2.5,
            left: 0,
            right: 0,
            child: Container(
              width: screenWidth(context),
              height: screenHeight(context),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              // child: Container(
              margin: EdgeInsets.only(top: kToolbarHeight - 50),
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        "Arya Kurniawan",
                        style: primaryTextStyle.copyWith(
                          fontWeight: bold,
                          fontSize: 16,
                          color: blackColor,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "aryakurniawan@gmail.com • 081234567890",
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                          color: disableColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Divider(thickness: 2),
                    ListTile(
                      leading: Image.asset(
                        'assets/icons/ic_profilepage.png',
                        width: 20,
                        height: 20,
                        color: midnightBlue,
                      ),
                      minLeadingWidth: 2,
                      visualDensity: VisualDensity.comfortable,
                      contentPadding: EdgeInsets.zero,
                      title: Text("Edit profile"),
                      onTap: () {
                        nextScreen(EditProfilePage());
                      },
                    ),
                    ListTile(
                      leading: Image.asset(
                        icSim,
                        width: 25,
                        height: 25,
                      ),
                      onTap: () {
                        nextScreen(
                          SimInfoPage(),
                        );
                      },
                      minLeadingWidth: 0,
                      visualDensity: VisualDensity.comfortable,
                      contentPadding: EdgeInsets.zero,
                      title: Text("Informasi SIM"),
                      trailing: Container(
                        width: 108,
                        height: 18,
                        decoration: BoxDecoration(
                            color: crimsonColor,
                            borderRadius: BorderRadius.circular(
                              10,
                            )),
                        child: Center(
                          child: Text(
                            'Perpanjang Sim',
                            style: primaryTextStyle.copyWith(
                              fontSize: 12,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        icPassword,
                        width: 25,
                        height: 25,
                      ),
                      visualDensity: VisualDensity.comfortable,
                      minLeadingWidth: 0,
                      contentPadding: EdgeInsets.zero,
                      title: Text("Ganti Password"),
                      onTap: () {
                        nextScreen(ChangePasswordPage());
                      },
                    ),
                    ListTile(
                      leading: Image.asset(
                        icTermCondition,
                        width: 25,
                        height: 25,
                      ),
                      minLeadingWidth: 0,
                      visualDensity: VisualDensity.comfortable,
                      contentPadding: EdgeInsets.zero,
                      title: Text("Syarat & Ketentuan"),
                      onTap: () {
                        nextScreen(TermConditionPage());
                      },
                    ),
                    ListTile(
                      minVerticalPadding: 0,
                      leading: Image.asset(
                        icPrivacyPolicy,
                        width: 25,
                        height: 25,
                      ),
                      minLeadingWidth: 0,
                      contentPadding: EdgeInsets.zero,
                      title: Text("Kebijakan Privasi"),
                      visualDensity: VisualDensity.comfortable,
                      onTap: () {
                        nextScreen(
                          PrivacyPolicyPage(),
                        );
                      },
                    ),
                    ListTile(
                      minVerticalPadding: 0,
                      leading: Image.asset(
                        icInfo,
                        width: 25,
                        height: 25,
                      ),
                      minLeadingWidth: 0,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity.comfortable,
                      title: Text("Tentang Aplikasi"),
                      onTap: () {
                        nextScreen(
                          InfoApplicationPage(),
                        );
                      },
                    ),
                    ListTile(
                      minVerticalPadding: 0,
                      leading: Image.asset(
                        icLogout,
                        width: 25,
                        height: 25,
                      ),
                      minLeadingWidth: 0,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity.comfortable,
                      title: Text("Logout"),
                      onTap: () {
                        GeneralDialog.show(
                          title: "Logout",
                          body:
                              "Apakah anda yakin ingin keluar dari\naplikasi ini?",
                          onTapNegative: () {},
                          onTapPositive: () {
                            nextScreenRemoveUntil(
                              LoginPage(),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: kToolbarHeight * 1.3,
            child: Container(
              width: 104,
              height: 104,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Container(
                width: 104,
                height: 104,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: midnightBlue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      12,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
