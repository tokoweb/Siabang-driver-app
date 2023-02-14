import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/modals/modal_province_selection.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../constant/strings.dart';
import '../../constant/theme.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  String? provinceSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Bantuan",
        color: Theme.of(context).scaffoldBackgroundColor,
        backIsDisable: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pilih wilayah layanan CS kami",
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                color: greyColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                ModalProvinceSelection.show(context).then((value) {
                  provinceSelected = value;
                  setState(() {});
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Text(provinceSelected ?? "Pilih wilayah tujuan"),
                    const Spacer(),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Divider(thickness: 2),
            Visibility(
              visible: provinceSelected != null,
              child: Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ListTile(
                      dense: false,
                      visualDensity: VisualDensity.standard,
                      minVerticalPadding: 2,
                      leading: Stack(
                        children: [
                          CircleAvatar(backgroundColor: crimsonColor),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              backgroundColor: green1Color,
                              radius: 5,
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        "Nama admin ${index + 1}",
                        style: primaryTextStyle.copyWith(
                          fontSize: 13,
                          color: blackColor,
                        ),
                      ),
                      subtitle: const Text("Khusus pengiriman udara"),
                      trailing: index == 1
                          ? Image.asset(
                              icWhatsappDeactive,
                              width: 35,
                              height: 35,
                            )
                          : GestureDetector(
                              onTap: () {
                                launchUrlString(
                                  Strings.urlAdminInfo,
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              child: Image.asset(
                                icWhatsappActive,
                                width: 35,
                                height: 35,
                              ),
                            ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
