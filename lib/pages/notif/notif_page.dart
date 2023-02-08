import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/constant/theme.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/notif/item_bar_notif.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> listBar = ["Semua", "Orderan", "Info", "Promo"];
  List<String> items = ["Orderan", "Orderan", "Info", "Orderan", "Promo"];
  List<String> bckupItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bckupItems.addAll(items);
  }

  int stateIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Notifikasi",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HeaderNotification(
          //   listBar: listBar,
          //   onTap: (index) {
          //     items = bckupItems;
          //     if (index != 0) {
          //       items = items.where((e) => e == listBar[index]).toList();
          //     }
          //     setState(() => stateIndex = index);
          //   },
          //   stateIndex: stateIndex,
          // ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Orderan Baru : ",
                              style: primaryTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: bold,
                                color: blackColor,
                              ),
                            ),
                            Text(
                              "Jemput di lokasi",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: bold,
                                color: blackColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet,  consect adipiscing elit, sed do eiusmod",
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                            color: blackColor,
                          ),
                        ),
                        Text(
                          "1 menit yang lalu",
                          style: primaryTextStyle.copyWith(
                            fontSize: 12,
                            color: greyColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Orderan Baru: ",
                              style: primaryTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: bold,
                                color: blackColor,
                              ),
                            ),
                            Text(
                              "Pengiriman dalam kota",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Ut enim ad minim veniam, quis nostrud\nexercitation ullamco laboris nisi ut aliquip ex ea",
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                            color: blackColor,
                          ),
                        ),
                        Text(
                          "10 jam yang lalu",
                          style: primaryTextStyle.copyWith(
                            fontSize: 12,
                            color: greyColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Orderan Selesai",
                              style: primaryTextStyle.copyWith(
                                fontSize: 12,
                                color: Colors.green,
                                fontWeight: bold,
                                fontFamily: GoogleFonts.poppins().toString(),
                              ),
                            ),
                            Text(
                              "",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Ut enim ad minim veniam, quis nostrud\nexercitation ullamco laboris nisi ut aliquip ex ea",
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                            color: blackColor,
                          ),
                        ),
                        Text(
                          "1 Hari yang lalu",
                          style: primaryTextStyle.copyWith(
                            fontSize: 12,
                            color: greyColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Orderan Pending ",
                              style: primaryTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: bold,
                                color: blackColor,
                                fontFamily: GoogleFonts.poppins().toString(),
                              ),
                            ),
                            Text(
                              "",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Ut enim ad minim veniam, quis nostrud\nexercitation ullamco laboris nisi ut aliquip ex ea",
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                            color: blackColor,
                          ),
                        ),
                        Text(
                          "22 Okt 2022 - 10:15",
                          style: primaryTextStyle.copyWith(
                            fontSize: 12,
                            color: greyColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Info ",
                              style: primaryTextStyle.copyWith(
                                fontSize: 12,
                                color: blackColor,
                                fontWeight: bold,
                                fontFamily: GoogleFonts.poppins().toString(),
                              ),
                            ),
                            Text(
                              "",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: bold,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Ut enim ad minim veniam, quis nostrud\nexercitation ullamco laboris nisi ut aliquip ex ea",
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                            color: blackColor,
                          ),
                        ),
                        Text(
                          "22 Okt 2022 - 10:15",
                          style: primaryTextStyle.copyWith(
                            fontSize: 12,
                            color: greyColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderNotification extends StatelessWidget {
  final List<String> listBar;
  final int stateIndex;
  final Function(int index) onTap;
  const HeaderNotification(
      {Key? key,
      required this.listBar,
      required this.stateIndex,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: listBar.map((e) {
          final index = listBar.indexWhere((a) => e == a);
          return ItemBarNotif(
            isActive: stateIndex == index,
            title: e,
            onTap: () => onTap(index),
          );
        }).toList()),
      ),
    );
  }
}
