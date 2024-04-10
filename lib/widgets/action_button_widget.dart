import 'package:flutter/material.dart';
import 'package:notes_app/theme/colors.dart';

class ActionButtonWidget extends StatelessWidget {
  final String text;
  final double width;
  final void Function()? onTap;

  const ActionButtonWidget(
      {super.key,
        required this.text,
        required this.width,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            color: AppColors.accentGrey,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}