import 'package:flutter/material.dart';
import '../../constant/theme.dart';

class CustomInputPassword extends StatefulWidget {
  final String title;
  final String? hintText;
  final TextInputType? inputType;
  final TextEditingController controller;
  final bool passwordMode;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final bool autoValid;
  final Widget? preffixWidget;
  final int? maxLines;
  final TextStyle? hintStyle;

  const CustomInputPassword(
      {Key? key,
      required this.title,
      required this.controller,
      this.inputType,
      this.hintText,
      this.validator,
      this.onChanged,
      this.autoValid = false,
      this.passwordMode = false,
      this.preffixWidget,
      this.maxLines,
      this.hintStyle})
      : super(key: key);

  @override
  State<CustomInputPassword> createState() => _CustomInputPasswordState();
}

class _CustomInputPasswordState extends State<CustomInputPassword> {
  bool _passwordInVisible = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: primaryTextStyle.copyWith(
            fontSize: 12,
            color: greyColor,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: widget.maxLines ?? 1,
          controller: widget.controller,
          // ignore: prefer_if_null_operators
          keyboardType: widget.inputType ?? TextInputType.text,
          autovalidateMode:
              widget.autoValid ? AutovalidateMode.onUserInteraction : null,
          obscureText: widget.passwordMode ? _passwordInVisible : false,
          validator: widget.validator,
          onChanged: widget.onChanged,
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            color: greyColor,
          ),
          decoration: InputDecoration(
            fillColor: aliceBlue,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            hintText: widget.hintText == null ? "" : widget.hintText!,
            hintStyle: widget.hintStyle ??
                primaryTextStyle.copyWith(
                  fontSize: 12,
                  color: greyColor,
                ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide:
                  BorderSide(color: greyColor.withOpacity(0.1), width: 0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide:
                  BorderSide(color: greyColor.withOpacity(0.1), width: 0),
            ),
            prefix: widget.preffixWidget ?? const SizedBox(),
            suffixIcon: widget.passwordMode
                ? IconButton(
                    icon: Icon(
                      _passwordInVisible
                          ? Icons.visibility_off
                          : Icons
                              .visibility, //change icon based on boolean value
                      color: blackColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordInVisible =
                            !_passwordInVisible; //change boolean value
                      });
                    },
                  )
                : const SizedBox(),
            errorStyle: const TextStyle(
              fontSize: 10.0,
            ),
            errorMaxLines: 4,
          ),
        )
      ],
    );
  }
}
