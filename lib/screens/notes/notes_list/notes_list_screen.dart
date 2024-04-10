import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants/months.dart';
import 'package:notes_app/models/news_model.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/router/router.dart';
import 'package:notes_app/theme/colors.dart';
import 'package:notes_app/widgets/action_button_widget.dart';
import 'package:notes_app/widgets/app_container.dart';

@RoutePage()
class NotesListScreen extends StatefulWidget {
  const NotesListScreen({super.key});

  @override
  State<NotesListScreen> createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  final searchController = TextEditingController();

  List<NoteModel> allNotes = [];
  List<NoteModel> notes = [];

  bool hasNotes = false;

  @override
  void initState() {
    getNotes();
    super.initState();
  }

  void getNotes() async {
    final noteBox = Hive.box('notes');

    if (noteBox.isNotEmpty) {
      for (int i = 0; i < noteBox.length; i++) {
        allNotes.add(noteBox.getAt(i));
      }
      allNotes = allNotes.reversed.toList();
      notes = allNotes;
      hasNotes = true;
    }
  }

  void searchNote(String query) {
    final suggestions = allNotes.where((note) {
      final noteText = note.name.toLowerCase();
      final input = query.toLowerCase();

      return noteText.contains(input);
    }).toList();

    setState(() => notes = suggestions);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      body: SafeArea(
        child: hasNotes
            ? SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'My notes',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          style: TextStyle(color: AppColors.white),
                          controller: searchController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: AppColors.white50,
                                fontWeight: FontWeight.w400),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SvgPicture.asset(
                                  'assets/images/notes/search.svg'),
                            ),
                            hintText: 'Write a note name',
                            filled: true,
                            fillColor: AppColors.fieldGrey,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          ),
                          onChanged: searchNote,
                        ),
                        ListView.separated(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: notes.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(height: 15,),
                          itemBuilder: (BuildContext context, int index) {
                            final NoteModel _note = notes[index];
                            return GestureDetector(
                              onTap: () {
                                context.router.push(NoteInfoRoute(note: _note));
                              },
                              child: AppContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _note.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Divider(
                                      color: _note.importance == 'High'
                                          ? AppColors.red
                                          : _note.importance == 'Medium'
                                              ? AppColors.yellow
                                              : AppColors.green,
                                    thickness: 2,),
                                    SizedBox(height: 5),
                                    Text(
                                      _note.note,
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: AppColors.white50,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset('assets/images/notes/tag.svg', width: 15),
                                            SizedBox(width: 3),
                                            Text(
                                              _note.tag,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: AppColors.white50,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${_note.date.day} ${months[_note.date.month]} ${_note.date.year}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              )
            : Container(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My notes',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: AppColors.white,
                        ),
                      ),
                      Image.asset(
                          'assets/images/elements/empty-note-image.png'),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: hasNotes ? 'Add new note' : 'Add your first note',
          width: 350,
          onTap: () {
            context.router.push(AddNoteRoute());
          }),
    );
  }
}
