import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:notes_app/notes_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(NotesApp());
}
