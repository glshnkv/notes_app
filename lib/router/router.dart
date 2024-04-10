import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:notes_app/screens/main/main_screen.dart';
import 'package:notes_app/screens/news/news_info/news_info_screen.dart';
import 'package:notes_app/screens/news/news_list/news_list_screen.dart';
import 'package:notes_app/screens/notes/add_note/add_note_screen.dart';
import 'package:notes_app/screens/notes/edit_note/edit_note_screen.dart';
import 'package:notes_app/screens/notes/note_info/note_info_screen.dart';
import 'package:notes_app/screens/notes/notes_list/notes_list_screen.dart';
import 'package:notes_app/screens/onboarding/onboarding_screen.dart';
import 'package:notes_app/models/news_model.dart';
import 'package:notes_app/screens/settings/settings_screen.dart';
import 'package:notes_app/models/note_model.dart';


part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
  AutoRoute(page: MainRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: NewsListRoute.page),
    AutoRoute(page: NewsInfoRoute.page),
    AutoRoute(page: NotesListRoute.page),
    AutoRoute(page: AddNoteRoute.page),
    AutoRoute(page: NoteInfoRoute.page),
    AutoRoute(page: EditNoteRoute.page),
  ];
}