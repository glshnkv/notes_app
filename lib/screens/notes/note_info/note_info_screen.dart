import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_app/constants/months.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/router/router.dart';
import 'package:notes_app/screens/notes/notes_bloc/notes_bloc.dart';
import 'package:notes_app/theme/colors.dart';
import 'package:notes_app/widgets/action_button_widget.dart';
import 'package:notes_app/widgets/app_container.dart';

@RoutePage()
class NoteInfoScreen extends StatefulWidget {
  final NoteModel note;
  const NoteInfoScreen({super.key, required this.note});

  @override
  State<NoteInfoScreen> createState() => _NoteInfoScreenState();
}

class _NoteInfoScreenState extends State<NoteInfoScreen> {
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
              context.router.pop();
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: AppContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.note.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Divider(
                    color: widget.note.importance == 'High'
                        ? AppColors.red
                        : widget.note.importance == 'Medium'
                        ? AppColors.yellow
                        : AppColors.green,
                    thickness: 2,),
                  SizedBox(height: 5),
                  Text(
                    widget.note.note,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.white50,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/notes/tag.svg', width: 15),
                          SizedBox(width: 3),
                          Text(
                            widget.note.tag,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.white50,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${widget.note.date.day} ${months[widget.note.date.month]} ${widget.note.date.year}',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ActionButtonWidget(text: 'Edit', width: 150, onTap: () {
                        context.router.push(EditNoteRoute(note: widget.note));

                      }),
                      GestureDetector(
                        onTap: () {
                          context.read<NotesBloc>().add(DeleteNoteEvent(note: widget.note));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.white,
                              content: Text(
                                'Successfully deleted!',
                                style: TextStyle(color: AppColors.accentGrey),
                              ),
                            ),
                          );
                          context.router.push(MainRoute());
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.accentGrey, width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(8.0))),
                          child: Center(
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
