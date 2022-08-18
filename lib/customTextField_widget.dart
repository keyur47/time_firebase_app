import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:time_firebase_app/app_colors.dart';

class CustomeTextField extends StatelessWidget {
  CustomeTextField(
      {Key? key,
      this.fontSize,
      this.onTap,
        this.hintStyle,
      this.suffixIcon,
      this.onChanged,
      this.keyboardType,
      this.radius,
      this.fillColor,
      this.textColor,
      required this.controller,
      this.maxLine,
      this.validator,
      this.contentPadding,
      this.labelText,
      this.isPassword = false,
      this.hintText,
        this.readOnly,
      this.isDense})
      : super(key: key);
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final int? maxLine;
  final Color? textColor;
  final double? fontSize;
  final bool isPassword;
  // final int? maxLength;
  final double? radius;
  final ValueNotifier<bool> _isObscure = ValueNotifier(true);
  final Widget? suffixIcon;
  final Color? fillColor;
  final VoidCallback? onTap;
  String? Function(String?)? validator;
  EdgeInsetsGeometry? contentPadding;
  String? labelText;
  String? hintText;
  bool? isDense;
  bool? readOnly;
  TextStyle? hintStyle;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _isObscure,
        builder: (context, bool isObscure, _) {
          if (!isPassword) {
            isObscure = false;
          }
          return IntrinsicHeight(
            child: Container(
              // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(radius ?? 10))),
              child: TextFormField(
                keyboardType: keyboardType,
                controller: controller,
                obscureText: isObscure,
                onTap: onTap,
                style: hintStyle,
                readOnly: readOnly ?? false,
                decoration: InputDecoration(
                  fillColor: AppColors.textFillColor,
                  filled: true,
                  isDense: isDense,
                  border: InputBorder.none,
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  // labelText: labelText,
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(
                  //     Radius.circular(radius ?? 10),
                  //   ),
                  //   borderSide: BorderSide(color: AppColors.textFillColor, width: 0),
                  // ),
                  hintText: hintText,
                  labelStyle: const TextStyle(fontWeight: FontWeight.w400, color: AppColors.lableTextColor),
                  suffixIcon: suffixIcon == null && isPassword
                      ? IconButton(
                          icon: Icon(
                            isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            _isObscure.value = !isObscure;
                          },
                        )
                      : suffixIcon,

                  contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
                  // focusedBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(Radius.circular(radius ?? 5)),
                  //   //  borderSide: BorderSide(color: AppColors.buttonColor),
                  // ),
                ),
                validator: validator,
                maxLines: maxLine,
              ),
            ),
          );
        });
  }
}
