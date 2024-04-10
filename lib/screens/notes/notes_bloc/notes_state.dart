part of 'notes_bloc.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class LoadedAllNotesState extends NotesState {
  final List<NoteModel> notes;

  LoadedAllNotesState({required this.notes});
}

class EmptyNotesListState extends NotesState {}