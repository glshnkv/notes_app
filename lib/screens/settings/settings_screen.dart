import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_app/theme/colors.dart';
import 'package:notes_app/widgets/action_button_widget.dart';
import 'package:notes_app/widgets/app_container.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: AppContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/elements/settings-image.png',
                              width: 260),
                          SizedBox(height: 20),
                          Text(
                            'Your opinion is important!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'We need your feedback to get better',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.white50,
                            ),
                          ),
                          SizedBox(height: 20),
                          ActionButtonWidget(
                              text: 'Rate app', width: 300, onTap: () {})
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  AppContainer(
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          leading: SvgPicture.asset(
                              'assets/images/settings/safety.svg'),
                          title: Text(
                            'Safety',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios_rounded,
                              color: AppColors.white50),
                        ),
                        ListTile(
                          onTap: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          leading: SvgPicture.asset(
                              'assets/images/settings/policy.svg'),
                          title: Text(
                            'Privacy policy',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          leading: SvgPicture.asset(
                              'assets/images/settings/bell.svg'),
                          title: Text(
                            'Notification',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                          ),
                          trailing: Switch(
                              value: true,
                              onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
