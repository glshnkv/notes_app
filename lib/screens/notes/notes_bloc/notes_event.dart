part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}

class GetAllNotesEvent extends NotesEvent {}

class AddNoteEvent extends NotesEvent {
  final NoteModel note;

  AddNoteEvent({required this.note});
}

class DeleteNoteEvent extends NotesEvent {
  final NoteModel note;

  DeleteNoteEvent({required this.note});
}

class EditNoteEvent extends NotesEvent {
  final NoteModel note;
  final NoteModel editedNote;

  EditNoteEvent({required this.note, required this.editedNote});
}