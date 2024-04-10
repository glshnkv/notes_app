// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddNoteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddNoteScreen(),
      );
    },
    EditNoteRoute.name: (routeData) {
      final args = routeData.argsAs<EditNoteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditNoteScreen(
          key: args.key,
          note: args.note,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    NewsInfoRoute.name: (routeData) {
      final args = routeData.argsAs<NewsInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsInfoScreen(
          key: args.key,
          news: args.news,
        ),
      );
    },
    NewsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsListScreen(),
      );
    },
    NoteInfoRoute.name: (routeData) {
      final args = routeData.argsAs<NoteInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NoteInfoScreen(
          key: args.key,
          note: args.note,
        ),
      );
    },
    NotesListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotesListScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [AddNoteScreen]
class AddNoteRoute extends PageRouteInfo<void> {
  const AddNoteRoute({List<PageRouteInfo>? children})
      : super(
          AddNoteRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddNoteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditNoteScreen]
class EditNoteRoute extends PageRouteInfo<EditNoteRouteArgs> {
  EditNoteRoute({
    Key? key,
    required NoteModel note,
    List<PageRouteInfo>? children,
  }) : super(
          EditNoteRoute.name,
          args: EditNoteRouteArgs(
            key: key,
            note: note,
          ),
          initialChildren: children,
        );

  static const String name = 'EditNoteRoute';

  static const PageInfo<EditNoteRouteArgs> page =
      PageInfo<EditNoteRouteArgs>(name);
}

class EditNoteRouteArgs {
  const EditNoteRouteArgs({
    this.key,
    required this.note,
  });

  final Key? key;

  final NoteModel note;

  @override
  String toString() {
    return 'EditNoteRouteArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsInfoScreen]
class NewsInfoRoute extends PageRouteInfo<NewsInfoRouteArgs> {
  NewsInfoRoute({
    Key? key,
    required NewsModel news,
    List<PageRouteInfo>? children,
  }) : super(
          NewsInfoRoute.name,
          args: NewsInfoRouteArgs(
            key: key,
            news: news,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsInfoRoute';

  static const PageInfo<NewsInfoRouteArgs> page =
      PageInfo<NewsInfoRouteArgs>(name);
}

class NewsInfoRouteArgs {
  const NewsInfoRouteArgs({
    this.key,
    required this.news,
  });

  final Key? key;

  final NewsModel news;

  @override
  String toString() {
    return 'NewsInfoRouteArgs{key: $key, news: $news}';
  }
}

/// generated route for
/// [NewsListScreen]
class NewsListRoute extends PageRouteInfo<void> {
  const NewsListRoute({List<PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NoteInfoScreen]
class NoteInfoRoute extends PageRouteInfo<NoteInfoRouteArgs> {
  NoteInfoRoute({
    Key? key,
    required NoteModel note,
    List<PageRouteInfo>? children,
  }) : super(
          NoteInfoRoute.name,
          args: NoteInfoRouteArgs(
            key: key,
            note: note,
          ),
          initialChildren: children,
        );

  static const String name = 'NoteInfoRoute';

  static const PageInfo<NoteInfoRouteArgs> page =
      PageInfo<NoteInfoRouteArgs>(name);
}

class NoteInfoRouteArgs {
  const NoteInfoRouteArgs({
    this.key,
    required this.note,
  });

  final Key? key;

  final NoteModel note;

  @override
  String toString() {
    return 'NoteInfoRouteArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [NotesListScreen]
class NotesListRoute extends PageRouteInfo<void> {
  const NotesListRoute({List<PageRouteInfo>? children})
      : super(
          NotesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotesListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
