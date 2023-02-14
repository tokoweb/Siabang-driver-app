import 'package:flutter/material.dart';
import 'package:siabang_driver_app/constant/theme.dart';

class AppBarPrimary extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color? color;
  final bool backIsDisable;
  final Function()? onBack;
  final double? size;
  final String? status;
  final Widget? leading;

  const AppBarPrimary(
      {Key? key,
      required this.title,
      this.actions,
      this.color,
      this.onBack,
      this.backIsDisable = false,
      this.size,
      this.status,
      this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: color ?? midnightBlue,
      iconTheme: const IconThemeData(
        color: Colors.black, //change your color here
      ),
      elevation: 0.0,
      // shape: Border(bottom: BorderSide(color: kScaffoldColor, width: 2)),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 15,
                left: 16,
                right: 16,
              ),
              child: !backIsDisable
                  ? Row(
                      children: [
                        GestureDetector(
                            onTap: onBack ?? () => Navigator.of(context).pop(),
                            child: Icon(Icons.arrow_back,
                                color: color != null ? spaceCadet : whiteColor,
                                size: 22)),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            title,
                            style: color != null
                                ? primaryTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: bold,
                                    color: blackColor,
                                  )
                                : primaryTextStyle.copyWith(
                                    fontSize: 18,
                                    color: whiteColor,
                                  ),
                          ),
                        ),
                        ...(actions ?? []).toList(),
                      ],
                    )
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          leading == null
                              ? const SizedBox()
                              : Container(
                                  margin: const EdgeInsets.only(right: 16),
                                  child: leading!,
                                ),
                          Expanded(
                            child: Text(
                              title,
                              style: color != null
                                  ? primaryTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: bold,
                                      color: blackColor,
                                    )
                                  : primaryTextStyle.copyWith(
                                      fontSize: 20, fontWeight: bold),
                            ),
                          ),
                          ...(actions ?? []).toList(),
                        ],
                      ),
                    ),
            ),
            Visibility(
              visible: status != null,
              child: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                color: midnightBlue.withOpacity(0.25),
                child: Text(
                  "$status",
                  style: primaryTextStyle.copyWith(
                    fontSize: 13,
                    color: blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size != null
      ? size!
      : status != null
          ? 100
          : 65);
}
