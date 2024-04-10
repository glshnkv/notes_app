import 'package:flutter/material.dart';
import 'package:notes_app/router/router.dart';

class NotesApp extends StatelessWidget {
  NotesApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Roboto'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
