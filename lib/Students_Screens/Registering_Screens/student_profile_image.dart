import 'dart:io';
import 'package:dtc_app/Components/Buttons.dart';
import 'package:dtc_app/Constants/Colors.dart';
import 'package:dtc_app/Students_Screens/Registering_Screens/Long_Courses/Acceptance_Qualifications.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Constants/Controller.dart';

class StudentProfileImage extends StatefulWidget {
  const StudentProfileImage({super.key});
  static String id = 'StudentProfileImage';

  @override
  State<StudentProfileImage> createState() => _StudentProfileImageState();
}

class _StudentProfileImageState extends State<StudentProfileImage> {
  bool gallery = false;
  bool camera = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(
                    left: 60, top: 50, right: 60, bottom: 10),
                height: 206,
                width: MediaQuery.of(context).size.width,
                child: studentProfileImagePath == null
                    ? Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: WhiteColor,
                            boxShadow: [BoxShadow(blurRadius: 4)],
                            borderRadius: const BorderRadius.all(
                                Radius.circular(20))),
                        child: Icon(
                          Icons.person,
                          color: BlackColor.withOpacity(0.8),
                          size: 200,
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.all(2),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: WhiteColor,
                            boxShadow: [BoxShadow(blurRadius: 4)],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Image.file(
                          studentProfileImagePath!,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: GreyColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        camera = false;
                        gallery = false;
                        setState(() {});
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // GestureDetector(
                                        //   child: Icon(Icons.close)),
                                        // const SizedBox(
                                        //   height: 20,
                                        // ),
                                        Row(children: [
                                          const Spacer(
                                            flex: 1,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              gallery = true;
                                              camera = false;
                                              setState(() {});
                                              studentProfileImageFile =
                                                  await ImagePicker().pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                              studentProfileImagePath = File(
                                                  studentProfileImageFile!
                                                      .path);
                                            },
                                            child: gallery == false
                                                ? Container(
                                                    height: 80,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: GreyColor),
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    20))),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(
                                                          Icons
                                                              .picture_in_picture_alt,
                                                          size: 50,
                                                        ),
                                                        Text('المعرض')
                                                      ],
                                                    ),
                                                  )
                                                : Container(
                                                    height: 80,
                                                    width: 80,
                                                    decoration: const BoxDecoration(
                                                        color: PrimaryColor,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(
                                                            Icons
                                                                .picture_in_picture_alt,
                                                            size: 50,
                                                            color: WhiteColor),
                                                        Text(
                                                          'المعرض',
                                                          style: TextStyle(
                                                              color:
                                                                  WhiteColor),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                          ),
                                          const Spacer(
                                            flex: 1,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              gallery = false;
                                              camera = true;
                                              setState(() {});
                                              studentProfileImageFile =
                                                  await ImagePicker().pickImage(
                                                      source:
                                                          ImageSource.camera);
                                              studentProfileImagePath = File(
                                                  studentProfileImageFile!
                                                      .path);
                                            },
                                            child: camera == false
                                                ? Container(
                                                    height: 80,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: GreyColor),
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    20))),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(
                                                          Icons.camera_alt,
                                                          size: 50,
                                                        ),
                                                        Text(
                                                          'الكاميرا',
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : Container(
                                                    height: 80,
                                                    width: 80,
                                                    decoration: const BoxDecoration(
                                                        color: PrimaryColor,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(Icons.camera_alt,
                                                            size: 50,
                                                            color: WhiteColor),
                                                        Text(
                                                          'الكاميرا',
                                                          style: TextStyle(
                                                              color:
                                                                  WhiteColor),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                          ),
                                          const Spacer(
                                            flex: 1,
                                          ),
                                        ]),
                                      ],
                                    ),
                                  );
                                },
                              );
                            });
                      },
                      child: Icon(
                        Icons.camera_alt,
                        size: 40,
                        color: BlackColor.withOpacity(0.8),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      studentSinUpEnglishFirstNameController.text +
                          studentSinUpEnglishLastNameController.text,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: Icon(
                      Icons.refresh,
                      size: 30,
                      color: BlackColor.withOpacity(0.8),
                    ),
                  ),
                  Text(
                    'تحديث',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  nextButton(
                      text: 'التالي',
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          AcceptanceQualifications.id,
                          (Route<dynamic> route) => false,
                        );
                      }),
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// imagePath == null
//                           ? CircleAvatar(
//                               foregroundColor: PrimaryColor,
//                               backgroundColor: BlackColor,
//                               radius: MediaQuery.of(context).size.width,
//                               child: CircleAvatar(
//                                 backgroundColor: Colors.grey.shade300,
//                                 radius: MediaQuery.of(context).size.width - 10,
//                                 child: 
//                               ),
//                             )
//                           : CircleAvatar(
//                               foregroundColor: PrimaryColor,
//                               backgroundColor: BlackColor,
//                               radius: MediaQuery.of(context).size.width,
//                               child: CircleAvatar(
//                                 child: Image.file(
//                                   imagePath!,
//                                   fit: BoxFit.contain,
//                                 ),
//                                 backgroundColor: Colors.grey.shade300,
//                                 radius: MediaQuery.of(context).size.width - 10,
//                               ),
//                             ),