import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/news_model.dart';
import 'package:notes_app/repository/news_repository.dart';
import 'package:notes_app/router/router.dart';
import 'package:notes_app/theme/colors.dart';
import 'package:notes_app/widgets/action_button_widget.dart';
import 'package:notes_app/widgets/app_container.dart';

@RoutePage()
class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'News',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: AppColors.white,
                  ),
                ),
                Container(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: newsRepository.length,
                    separatorBuilder: (BuildContext context, int index) =>
                    const Divider(thickness: 1, color: AppColors.fieldGrey),
                    itemBuilder: (BuildContext context, int index) {
                      final NewsModel _news = newsRepository[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              child: Image.asset(
                                _news.image,
                                fit: BoxFit.cover,
                                height: 130,
                                width: double.infinity,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              _news.title,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              _news.article,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.white50,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 10),
                            ActionButtonWidget(text: 'Read more', width: double.infinity, onTap: () {
                              context.router.push(NewsInfoRoute(news: _news));
                            }),
                          ],
                        ),
                      );
                    },
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
