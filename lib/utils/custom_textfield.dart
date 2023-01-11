import 'package:flutter/material.dart';
import 'package:invoice_web/utils/constants.dart';

Widget customTextField({
  required BuildContext context,
  TextEditingController? controller,
  int? maxLength,
  TextInputType? textInputType,
  String? hintText,
  double? textSpacing,
  String? prefixText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool? readOnly,
  FocusNode? focusnode,
  int? maxlines,
  bool? obscureText,
  void Function()? onTap,
  String? Function(String? value)? validator,
  String? Function(String)? onChanged,
  String? Function(String)? onFieldSubmitted,
}) {
  return TextFormField(
    onTap: onTap,
    onFieldSubmitted: onFieldSubmitted,
    onChanged: onChanged,
    focusNode: focusnode,
    readOnly: readOnly ?? false,
    controller: controller,
    maxLength: maxLength,
    maxLines: maxlines,
    validator: validator,
    keyboardType: textInputType,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: textSpacing,
      // color: textColor,
      decoration: TextDecoration.none,
    ),
    decoration: InputDecoration(
      // fillColor: Colors.white,
      hintText: hintText,
      hintStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white38,
        fontWeight: FontWeight.w400,
      ),
      filled: true,
      counterText: "",
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      // prefixStyle: const TextStyle(color: strokeColor, fontSize: 18),
      prefixText: prefixText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: blackColor, width: 0.4),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.red),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: blackColor, width: 0.4),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          width: 2,
          color: Colors.red,
        ),
      ),
    ),
    obscureText: obscureText ?? false,
  );
}
