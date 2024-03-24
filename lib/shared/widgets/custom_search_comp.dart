import 'package:flutter/material.dart';

import '../../common/constants/font_size.dart' as font_size;

class BuildTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final TextInputType inputType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enabled;
  final int? maxLength;
  final ValueChanged<String> onChanged;

  const BuildTextField(
      {super.key,
      required this.hint,
      this.controller,
      this.inputType = TextInputType.none,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.enabled = true,
      this.maxLength,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (val) => val!.isEmpty ? 'required' : null,
      keyboardType: inputType,
      obscureText: obscureText,
      maxLength: maxLength,
      maxLines: inputType == TextInputType.multiline ? 3 : 1,
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        prefixIcon: _boxIcon(prefixIcon),
        suffixIcon: _boxIcon(suffixIcon),
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      // cursorColor: kPrimaryColor,
      // style: const TextStyle(
      //   fontSize: font_size.textMedium,
      //   fontWeight: FontWeight.normal,
      //   color: kBlackColor,
      // ),
    );
  }

  Widget? _boxIcon(Widget? child) {
    if (child == null) return null;
    return Container(alignment: Alignment.center, width: 24, height: 24, child: child);
  }
}
