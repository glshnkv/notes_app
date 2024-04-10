import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/router/router.dart';
import 'package:notes_app/screens/notes/add_note/custom_chips.dart';
import 'package:notes_app/screens/notes/notes_bloc/notes_bloc.dart';
import 'package:notes_app/theme/colors.dart';
import 'package:notes_app/widgets/action_button_widget.dart';
import 'package:notes_app/widgets/app_container.dart';
import 'package:notes_app/widgets/textfield_app_widget.dart';

@RoutePage()
class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  int _pageIndex = 0;

  DateTime date = DateTime.now();

  final pageController = PageController();

  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final tagController = TextEditingController();
  final noteController = TextEditingController();

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (_picked != null) {
      date = _picked;
      setState(() {
        dateController.text = '${_picked.month}-${_picked.day}-${_picked.year}';
      });
    }
  }

  String _selectedImportance = 'High';

  @override
  void dispose() {
    nameController.dispose();
    dateController.dispose();
    tagController.dispose();
    noteController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      appBar: AppBar(
        backgroundColor: AppColors.bgGrey,
        leadingWidth: 110,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: GestureDetector(
            onTap: () {
              context.router.push(MainRoute());
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new, color: AppColors.white),
                SizedBox(width: 5),
                Text(
                  'Back',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          _pageIndex == 1
              ? Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      if (nameController.text.isNotEmpty &&
                          dateController.text.isNotEmpty &&
                          tagController.text.isNotEmpty &&
                          noteController.text.isNotEmpty) {
                        context.read<NotesBloc>().add(AddNoteEvent(
                            note: NoteModel(
                                note: noteController.text,
                                name: nameController.text,
                                tag: tagController.text,
                                importance: _selectedImportance,
                                date: date)));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AppColors.white,
                            content: Text(
                              'New note created!',
                              style: TextStyle(color: AppColors.accentGrey),
                            ),
                          ),
                        );
                        context.router.push(MainRoute());
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AppColors.red,
                            content: Text(
                              'Firstly, enter information',
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New note',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFieldAppWidget(
                        controller: nameController,
                        hintText: 'Note name',
                        iconPath: 'assets/images/notes/note.svg',
                      ),
                      SizedBox(height: 10),
                      TextField(
                        style: TextStyle(color: Colors.white),
                        controller: dateController,
                        readOnly: true,
                        onTap: () {
                          _selectDate();
                        },
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: AppColors.white50,
                              fontWeight: FontWeight.w400),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: SvgPicture.asset(
                                'assets/images/notes/date.svg'),
                          ),
                          suffixIconConstraints: BoxConstraints(
                            maxWidth: 40,
                          ),
                          hintText: 'Note date',
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
                      ),
                      SizedBox(height: 10),
                      TextFieldAppWidget(
                        controller: tagController,
                        hintText: 'Note tag',
                        iconPath: 'assets/images/notes/tag.svg',
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Degree of importance',
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
                          CustomChips(
                            opacity: _selectedImportance == 'High' ? 1.0 : 0.5,
                            title: 'High',
                            color: AppColors.red,
                            onTap: () {
                              setState(() {
                                _selectedImportance = 'High';
                              });
                            },
                          ),
                          CustomChips(
                            opacity:
                                _selectedImportance == 'Medium' ? 1.0 : 0.5,
                            title: 'Medium',
                            color: AppColors.yellow,
                            onTap: () {
                              setState(() {
                                _selectedImportance = 'Medium';
                              });
                            },
                          ),
                          CustomChips(
                            opacity: _selectedImportance == 'Low' ? 1.0 : 0.5,
                            title: 'Low',
                            color: AppColors.green,
                            onTap: () {
                              setState(() {
                                _selectedImportance = 'Low';
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: ActionButtonWidget(
                            text: 'Next',
                            width: 350,
                            onTap: () {
                              pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New note',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: AppColors.fieldGrey,
                        thickness: 1,
                      ),
                      SizedBox(height: 10),
                      TextField(
                        maxLines: 15,
                        style: TextStyle(color: AppColors.white),
                        controller: noteController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.fieldGrey,
                          hintText: 'Note text..',
                          hintStyle: TextStyle(
                              color: AppColors.white50,
                              fontWeight: FontWeight.w400),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
