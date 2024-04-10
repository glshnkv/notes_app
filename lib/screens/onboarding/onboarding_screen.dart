import 'package:auto_route/auto_route.dart';
import 'package:chip_list/chip_list.dart';

import 'package:flutter/material.dart';
import 'package:notes_app/router/router.dart';
import 'package:notes_app/theme/colors.dart';
import 'package:notes_app/widgets/action_button_widget.dart';
import 'package:notes_app/widgets/textfield_app_widget.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();

  final nameController = TextEditingController();

  List<String> timesList = ['Often', 'Sometimes', 'Rarely'];
  String times = 'Often';
  int _timesIndex = 0;

  int _pageIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      body: SafeArea(
        child: Container(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/elements/onboarding-image.png',
                      width: 310),
                  SizedBox(height: 40),
                  Text(
                    'Welcome to our app!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Write notes, track your thoughts, and find interesting news that will spur you on to new ideas',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.white50,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Let\'s get acquainted',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      style: TextStyle(color: AppColors.white),
                      controller: nameController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: AppColors.white50, fontWeight: FontWeight.w400),
                        hintText: 'Write your name',
                        filled: true,
                        fillColor: AppColors.fieldGrey,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.accentGrey),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'How often do you write notes?',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.white50,
                      ),
                    ),
                    SizedBox(height: 5),
                    ChipList(
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      listOfChipNames: timesList,
                      activeBorderColorList: [AppColors.bgGrey],
                      inactiveBorderColorList: [AppColors.bgGrey],
                      activeBgColorList: [AppColors.fieldGrey],
                      inactiveBgColorList: [AppColors.fieldGrey],
                      activeTextColorList: [AppColors.white],
                      inactiveTextColorList: [AppColors.white],
                      listOfChipIndicesCurrentlySeclected: [_timesIndex],
                      shouldWrap: true,
                      checkmarkColor: AppColors.white,
                      extraOnToggle: (val) {
                        _timesIndex = val;
                        setState(() {
                          times = timesList[_timesIndex];
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: _pageIndex == 0 ? 'Next' : 'Continue',
          width: 350,
          onTap: () {
            if (_pageIndex == 0) {
              pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            } else {
              context.router.push(MainRoute());
            }
          }),
    );
  }
}
