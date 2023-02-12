// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:siabang_driver_app/domain/commons/nav_utils.dart';

import '../../constant/theme.dart';

class ModalImagePicker {
  static Future show(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      backgroundColor: Colors.transparent,
      builder: (_) {
        return ImagePickerModalView();
      },
    );
  }
}

class ImagePickerModalView extends StatelessWidget {
  const ImagePickerModalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
            "Tambahkan Foto",
            style: primaryTextStyle.copyWith(
              fontWeight: bold,
              color: blackColor,
            ),
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              backScreen();
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3,
              shadowColor: greyColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.photo_camera_outlined,
                      color: midnightBlue,
                    ),
                    SizedBox(width: 16),
                    Text("Kamera")
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              backScreen();
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3,
              shadowColor: greyColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.photo,
                      color: midnightBlue,
                    ),
                    SizedBox(width: 16),
                    Text("Galeri")
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
