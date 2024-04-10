import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/news_model.dart';
import 'package:notes_app/theme/colors.dart';

@RoutePage()
class NewsInfoScreen extends StatefulWidget {
  final NewsModel news;
  const NewsInfoScreen({super.key, required this.news});

  @override
  State<NewsInfoScreen> createState() => _NewsInfoScreenState();
}

class _NewsInfoScreenState extends State<NewsInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      appBar: AppBar(
        backgroundColor: AppColors.bgGrey,
        leadingWidth: 110,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: GestureDetector(
            onTap: () {
              context.router.pop();
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new, color: AppColors.white),
                SizedBox(width: 5),
                Text(
                  'Back',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image.asset(
                    widget.news.image,
                    fit: BoxFit.cover,
                    height: 170,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  widget.news.title,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.news.article,
                  style: TextStyle(
                    color: AppColors.white50,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
