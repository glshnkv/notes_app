import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(NotesInitial()) {
    on<GetAllNotesEvent>(_GetAllNotesHandler);
    on<AddNoteEvent>(_addNoteHandler);
    on<DeleteNoteEvent>(_deleteNoteHandler);
    on<EditNoteEvent>(_editNoteHandler);
  }

  void _GetAllNotesHandler(
      GetAllNotesEvent event, Emitter<NotesState> emit) async {
    List<NoteModel> notes = [];

    final noteBox = Hive.box('notes');

    if (noteBox.isNotEmpty) {
      for (int i = 0; i < noteBox.length; i++) {
        notes.add(noteBox.getAt(i));
      }

      emit(LoadedAllNotesState(
          notes: notes.reversed.toList()));
    } else {
      emit(EmptyNotesListState());
    }
  }

  void _addNoteHandler(
      AddNoteEvent event, Emitter<NotesState> emit) async {
    final noteBox = Hive.box('notes');
    noteBox.add(event.note);
  }

  void _deleteNoteHandler(
      DeleteNoteEvent event, Emitter<NotesState> emit) async {

    List<NoteModel> notes = [];

    final noteBox = Hive.box('notes');

    if (noteBox.isNotEmpty) {
      for (int i = 0; i < noteBox.length; i++) {
        notes.add(noteBox.getAt(i));
      }

      final int _foundIndex = notes.indexOf(event.note);
      noteBox.deleteAt(_foundIndex);
    }
  }

  void _editNoteHandler(
      EditNoteEvent event, Emitter<NotesState> emit) async {

    List<NoteModel> notes = [];

    final noteBox = Hive.box('notes');

    if (noteBox.isNotEmpty) {
      for (int i = 0; i < noteBox.length; i++) {
        notes.add(noteBox.getAt(i));
      }

      final int _foundIndex = notes.indexOf(event.note);
      noteBox.putAt(_foundIndex, event.editedNote);
    }
  }
}
