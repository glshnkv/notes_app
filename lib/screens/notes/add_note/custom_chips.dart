import 'package:flutter/material.dart';
import 'package:notes_app/theme/colors.dart';

class CustomChips extends StatelessWidget {
  final double opacity;
  final void Function()? onTap;
  final String title;
  final Color color;

  const CustomChips(
      {super.key,
      required this.opacity,
      required this.onTap,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
              color: AppColors.fieldGrey,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 8),
              Container(
                color: color,
                height: 4,
                width: 75,
              )
            ],
          ),
        ),
      ),
    );
  }
}
