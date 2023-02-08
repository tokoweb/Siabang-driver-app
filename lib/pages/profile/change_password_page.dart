import 'package:flutter/material.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/widgets/appbar/appbar_primary.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';
import 'package:siabang_driver_app/widgets/customTextField/custom_input_password.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Ganti password",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(children: [
          CustomInputPassword(
            title: "Ketik password lama",
            controller: oldPasswordController,
            passwordMode: true,
          ),
          const SizedBox(height: 16),
          CustomInputPassword(
            title: "Ketik password baru",
            controller: newPasswordController,
            passwordMode: true,
          ),
          const SizedBox(height: 16),
          CustomInputPassword(
            title: "Ketik ulang password baru",
            controller: confirmPasswordController,
            passwordMode: true,
          ),
          const SizedBox(height: 32),
          ButtonPrimary(
            title: "Simpan",
            onTap: () {
              backScreenUntil();
            },
          )
        ]),
      ),
    );
  }
}
