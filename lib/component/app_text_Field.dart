import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  final String text;
  final bool value;
  final TextEditingController controller;

  const AppTextField({
    Key? key,
    required this.text,
    required this.value,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: text == 'title'
          ? const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
          : const TextStyle(fontWeight: FontWeight.normal),
      maxLines: text == 'title' ? 1 : 99,
      readOnly: !value,
      controller: controller,
      cursorColor: const Color(0xFF32A8F8),
      decoration: InputDecoration(
        fillColor: text == 'title'
            ? value == true ? Colors.white : const Color(0xFFF5F8FA)
            : Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: value == true ? const Color(0xFF32A8F8) : Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: value == true ? const Color(0xFF32A8F8) : Colors.transparent,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: text == 'title'
            ? const EdgeInsets.symmetric(horizontal: 12)
            : const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      ),
    );
  }
}
