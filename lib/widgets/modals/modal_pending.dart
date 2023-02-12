// ignore_for_file: prefer_const_constructors, prefer_final_fields
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';
import 'package:siabang_driver_app/domain/commons/widgets/data_photo.dart';
import 'package:siabang_driver_app/pages/task/status_order_page.dart';
import 'package:siabang_driver_app/widgets/button/button_primary.dart';
import 'package:siabang_driver_app/widgets/customTextField/customTextField.dart';
import 'package:siabang_driver_app/widgets/customTextField/customTextForm.dart';
import 'package:siabang_driver_app/widgets/dialog/general_dialog.dart';
import 'package:siabang_driver_app/widgets/dialog/success_task_option_dialog.dart';
import 'package:siabang_driver_app/widgets/modals/modal_image_picker.dart';

import '../../../constant/export_constant.dart';
import '../../constant/theme.dart';

class ModalPending {
  static Future show(BuildContext context, {String? initialValue}) async {
    return await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      isScrollControlled: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return DeliveryPendingTaskView(initialValue: initialValue);
      },
    );
  }
}

class DeliveryPendingTaskView extends StatefulWidget {
  final String? initialValue;
  const DeliveryPendingTaskView({Key? key, this.initialValue})
      : super(key: key);

  @override
  State<DeliveryPendingTaskView> createState() =>
      _DeliveryPendingTaskViewState();
}

class _DeliveryPendingTaskViewState extends State<DeliveryPendingTaskView> {
  TextEditingController queryController = TextEditingController();
  String? value;
  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            "Pengiriman pending",
            style: primaryTextStyle.copyWith(
              fontWeight: bold,
              color: blackColor,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Jelaskan kenapa pengiriman tertunda',
                      style: primaryTextStyle.copyWith(
                        color: blackColor,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      title: 'Deskripsi',
                      hintText: 'Deskripsi',
                      maxLines: 4,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Upload foto bukti pengiriman pending',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                        color: spaceCadet.withOpacity(0.4),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 102,
                          height: 102,
                          child: DataPhoto(
                            onTap: () {
                              ModalImagePicker.show(context);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 102,
                          height: 102,
                          child: DataPhoto(
                            onTap: () {
                              ModalImagePicker.show(context);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 102,
                          height: 102,
                          child: DataPhoto(
                            onTap: () {
                              ModalImagePicker.show(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 50,
                      ),
                      child: ButtonPrimary(
                        title: "Kirim",
                        onTap: () {
                          TaskOptionDialog.show(
                              title: 'Konfirmasi pending\ntelah dikirim');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
