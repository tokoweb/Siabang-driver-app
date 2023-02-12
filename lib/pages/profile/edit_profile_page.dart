import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/export_constant.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';
import 'package:siabang_driver_app/widgets/customTextField/customTextField.dart';

import '../../constant/theme.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emaiController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Edit Profile",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 98,
                  height: 98,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        ppImages,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: kToolbarHeight * 1,
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: midnightBlue,
                    child: Icon(Icons.edit, color: whiteColor),
                  ),
                )
              ],
            ),
            CustomInputText(
              title: "Nama",
              controller: nameController,
            ),
            const SizedBox(height: 16),
            CustomInputText(
              title: "Email",
              controller: emaiController,
            ),
            const SizedBox(height: 16),
            CustomInputText(
              title: "No. whatsapp",
              controller: emaiController,
            ),
            const SizedBox(height: 32),
            ButtonPrimary(
              title: "Simpan",
              onTap: () {
                backScreen();
              },
            )
          ],
        ),
      ),
    );
  }
}
