import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/TextStyle.dart';
import 'Student_MyCourses_Page.dart';
import 'Student_Profile_Notes_Page.dart';
import 'Student_Saved_Page.dart';
import 'Student_Privacy_Page.dart';

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});
  static String id = 'StudentProfilePage';

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
              backgroundColor: PrimaryColor,
              leading: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: CircleAvatar(
                  backgroundColor: WhiteColor,
                  child: Icon(
                    Icons.person,
                    color: PrimaryColor,
                  ),
                ),
              ),
              title: const Text('اسم المستخدم'),
              bottom: const TabBar(
                indicatorColor: WhiteColor,
                unselectedLabelStyle: TextStyle(fontSize: 15),
                labelStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                tabs: [
                  // Tab(
                  //   child: Text('Settings'),
                  // ),
                  Tab(
                    child: Text(
                      'المحفوظات',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'الملاحظات',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'الخصوصية',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  // Tab(
                  //   child: Text(
                  //     'دوراتي',
                  //     style: TextStyle(fontSize: 13),
                  //   ),
                  // ),
                ],
              )),
          body: const TabBarView(
            children: [
              // BrowserSettingsPage(),
              StudentSavedPage(),
              StudentProfileNotesPage(),
              StudentPrivacyPage(),
              // StudentMyCoursesPage()
            ],
          )),
    );
  }
}
