
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_app/theme/colors.dart';

class TextFieldAppWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String iconPath;

  const TextFieldAppWidget({
    super.key,
    required this.controller,
    required this.hintText, required this.iconPath,
  });

  @override
  State<TextFieldAppWidget> createState() => _TextFieldAppWidgetState();
}

class _TextFieldAppWidgetState extends State<TextFieldAppWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: AppColors.white),
      controller: widget.controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: AppColors.white50, fontWeight: FontWeight.w400),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: SvgPicture.asset(widget.iconPath),
        ),
        suffixIconConstraints: BoxConstraints(
          maxWidth: 40,
        ),
        hintText: widget.hintText,
        filled: true,
        fillColor: AppColors.fieldGrey,
        contentPadding:
        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
    );
  }
}