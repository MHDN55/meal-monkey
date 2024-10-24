// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final TextInputType keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;
  final String fieldHint;
  final TextEditingController controller;
  final GlobalKey<FormState> formState = GlobalKey();
  CustomTextFormFieldWidget({
    super.key,
    required this.keyboardType,
    required this.isPassword,
    this.validator,
    required this.fieldHint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: TextFormField(
        validator: validator,
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
        ],
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide.none,
          ),
          focusColor: const Color(0xffCCCCCC),
          contentPadding: const EdgeInsets.all(18),
          fillColor: const Color(0xffF2F2F2),
          filled: true,
          hintText: fieldHint,
          hintStyle: TextStyle(
            color: const Color(0xffB6B7B7),
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
