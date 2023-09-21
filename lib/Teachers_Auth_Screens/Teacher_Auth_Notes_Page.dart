import 'package:dtc_app/Constants/Colors.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:flutter/material.dart';

import '../Components/Notes.dart';
import '../Components/loading.dart';
import '../Start_App_Screens/SignUp_Type.dart';
import '../api/models/note_model.dart';
import '../api/services/note_services.dart';
import 'Teacher_Auh__Editing_Notes.dart';
import 'Teacher_Auth_Adding_Notes.dart';
import 'Teacher_Auth_Profile_Page.dart';

class TeacherAuthNotesPage extends StatefulWidget {
  const TeacherAuthNotesPage({super.key});
  static String id = '/TeacherAuthNotesPage';

  @override
  State<TeacherAuthNotesPage> createState() => _TeacherAuthNotesPageState();
}

class _TeacherAuthNotesPageState extends State<TeacherAuthNotesPage> {
  List notes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: PrimaryColor,
            onPressed: () async {
              final NoteModel? note =
                  await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TeacherAuthAddingNotes(),
              ));
              if (note != null) {
                notes.add(note);
                setState(() {});
              }
            },
            child: const Icon(
              Icons.add,
              size: 40,
              color: WhiteColor,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          actions: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.center,
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                color: PrimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'IT',
                style: TextStyle(
                    color: WhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: PrimaryColor,
          child: FutureBuilder(
              future: AuthServices.getUserInformation(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || !mounted) return Loading();
                final users = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.only(left: 15, top: 50, right: 15),
                  child: Column(children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (contex) {
                              return TeacherAuthProfilePage();
                            }));
                          },
                          child: CircleAvatar(
                              minRadius: 30,
                              maxRadius: 30,
                              backgroundColor: WhiteColor,
                              // ignore: unnecessary_null_comparison
                              child: users.image.toString() == null
                                  ? Icon(
                                      Icons.person,
                                      color: PrimaryColor,
                                      size: 45,
                                    )
                                  : Image.network(
                                      users.image.toString(),
                                      fit: BoxFit.cover,
                                      height: 30,
                                      width: 30,
                                    )),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              users.first_name_en.toString() +
                                  ' ' +
                                  users.last_name_en.toString(),
                              style: TextStyle(
                                  color: WhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              users.email.toString(),
                              style: TextStyle(
                                color: WhiteColor,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(color: WhiteColor, thickness: 2),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: const [
                          Icon(
                            Icons.people,
                            color: WhiteColor,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'دعوة صديق',
                            style: TextStyle(
                                color: WhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        AuthServices.postLogout();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          SignUpType.id,
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.exit_to_app_rounded,
                            color: RedColor,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'تسجيل الخروج',
                            style: TextStyle(
                                color: RedColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ]),
                );
              }),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 10),
          child: FutureBuilder<List<NoteModel>>(
              future: NoteServices.getNote(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || !mounted) return Loading();
                notes = snapshot.data!;
                return ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) => Note(
                    note: notes[index],
                    onEditPressed: () async {
                      final NoteModel? note =
                          await Navigator.of(context).pushNamed(
                        TeacherAuthEditingNotes.id,
                      );
                      if (note != null) {
                        notes.add(note);
                        setState(() {});
                      }
                    },
                    onDeletePressed: () {},
                    noteTitle: notes[index].title,
                    noteClassification: notes[index].category,
                    noteText: notes[index].description,
                  ),
                );
              }),
        ));
  }
}
