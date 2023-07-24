import 'package:flutter/material.dart';

import '../Components/Buttons.dart';
import '../Components/DropDownSearch.dart';
import '../Components/Label.dart';
import '../Components/TextField.dart';
import '../Constents/Colors.dart';
import '../Constents/Controller.dart';
import '../Constents/TextStyle.dart';

class MovingRequestPage extends StatefulWidget {
  const MovingRequestPage({super.key});
  static String id = 'MovingRequestPage';

  @override
  State<MovingRequestPage> createState() => _MovingRequestPageState();
}

class _MovingRequestPageState extends State<MovingRequestPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: const Text('طلب الإنتقال'),
      ),
      body: Form(
          key: formState,
          child: SingleChildScrollView(
            child: Container(
              height: height - 92,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'الإسم الكامل'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: studentMRFullNameController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'الحقل مطلوب';
                                  } else if (text.length < 3) {
                                    return 'الحقل يجب أن يكون 5 أحرف او أكثر';
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'المعدل دون مادة الديانة'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: studentMRMarkController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'الحقل مطلوب';
                                  } else if (text.length < 4) {
                                    return 'الحقل يجب أن يكون 4 أرقام';
                                  } else if (text.length > 4) {
                                    return 'الحقل يجب أن يكون 4 أرقام';
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'القسم الحالي'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationDropDownSearch(
                                  hint: '',
                                  items: [
                                    'تكنولوجيا المعلومات',
                                    'الطبي',
                                    'الهندسي',
                                    'التجاري',
                                    'الميكانيكي'
                                  ],
                                  onChange: (data) {
                                    currentDepartment = data!;
                                  },
                                  validator: (data) {})
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'الفرع الحالي'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationDropDownSearch(
                                  hint: '',
                                  items: [],
                                  onChange: (data) {
                                    currentClass = data!;
                                  },
                                  validator: (data) {})
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'القسم المراد الإنتقال إليه'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationDropDownSearch(
                                  hint: '',
                                  items: [
                                    'تكنولوجيا المعلومات',
                                    'الطبي',
                                    'الهندسي',
                                    'التجاري',
                                    'الميكانيكي'
                                  ],
                                  onChange: (data) {
                                    newDepartment = data!;
                                  },
                                  validator: (data) {})
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'الفرع المراد الإنتقال إليه'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationDropDownSearch(
                                  hint: '',
                                  items: [],
                                  onChange: (data) {
                                    newClass = data!;
                                  },
                                  validator: (data) {})
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Column(
                      children: [
                        titleText(text: 'نص طلب الإنتقال'),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            onChanged: (data) {},
                            controller: movingRequestTextController,
                            validator: (text) {
                              if (text!.isEmpty) {
                                return 'الحقل مطلوب';
                              }
                            },
                            keyboardType: TextInputType.text,
                            enabled: true,
                            cursorColor: GreyColor,
                            decoration: InputDecoration(
                              hintText: 'أكتب هنا...',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 50),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: GreyColor),
                              ),
                            )),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      nextButton(text: 'إنهاء', onTap: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
