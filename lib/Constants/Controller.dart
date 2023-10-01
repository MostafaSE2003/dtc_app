import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

//Browser Controllers
var browserCourseNationalityController = TextEditingController();
var browserCourseCurrentLocationController = TextEditingController();
var browserCourseBirthDateController = TextEditingController();
var browserSignInEmailController = TextEditingController();
var browserSignInPasswordController = TextEditingController();
var browserSignUpEmailController = TextEditingController();
var browserSignUpPasswordController = TextEditingController();
var browserSignUpPhoneController = TextEditingController();
var browserForgotPasswordEmailController = TextEditingController();
var browserForgotPasswordCodeController = TextEditingController();
var browserForgotPasswordNewPassword = TextEditingController();
var browserForgotPasswordConfirmPassword = TextEditingController();
var browserCurrentPassword = TextEditingController();
var browserNewPassword = TextEditingController();
var browserConfirmPassword = TextEditingController();
var browserSinUpFirstNameController = TextEditingController();
var browserSinUpLastNameController = TextEditingController();
var browserSinUpEnglishFirstNameController = TextEditingController();
var browserSinUpEnglishLastNameController = TextEditingController();
var browserPrivacyEditingPhone = TextEditingController();
var browserPrivacyEditingLocation = TextEditingController();
String browserNationalityVariable = '';
String browserSituationVariable = '';
String browserGenderVariable = '';
XFile? browserProfileImageFile;
File? browserProfileImagePath;

//Student Controllers
var studentEMRGainedMarkController = TextEditingController();
var markEditingRequestTextController = TextEditingController();
var studentNoteClassification = TextEditingController();
var studentNoteTitle = TextEditingController();
var studentNoteText = TextEditingController();
var studentEditingNoteClassification = TextEditingController();
var studentEditingNoteTitle = TextEditingController();
var studentEditingNoteText = TextEditingController();
var studentForgotPasswordEmailController = TextEditingController();
var studentForgotPasswordCodeController = TextEditingController();
var studentForgotPasswordNewPassword = TextEditingController();
var studentForgotPasswordConfirmPassword = TextEditingController();
var studentCurrentPassword = TextEditingController();
var studentNewPassword = TextEditingController();
var studentConfirmPassword = TextEditingController();
var studentMRMarkController = TextEditingController();
var movingRequestTextController = TextEditingController();
var studentCoursePhoneNumberController = TextEditingController();
var studentCourseCurrentLocationController = TextEditingController();
var studentCourseBirthDateController = TextEditingController();
var studentSignInEmailController = TextEditingController();
var studentSignInPasswordController = TextEditingController();
var studentSignUpEmailController = TextEditingController();
var studentSignUpPasswordController = TextEditingController();
var studentSignUpPhoneController = TextEditingController();
var studentFullNameController = TextEditingController();
var studentPrivacyEditingPhone = TextEditingController();
var studentPrivacyEditingLocation = TextEditingController();
var studentFatherNameController = TextEditingController();
var studentMotherNameController = TextEditingController();
var studentBirthPlaceController = TextEditingController();
var studentBirthDateController = TextEditingController();
var studentEnglishFullNameController = TextEditingController();
var studentSoliderController = TextEditingController();
var studentCurrentController = TextEditingController();
var studentPermanentController = TextEditingController();
var studentTotalDegreesController = TextEditingController();
var guardianNameController = TextEditingController();
var guardianWorkController = TextEditingController();
var guardianPhoneNumberController = TextEditingController();
var studentMotherPhoneNumberController = TextEditingController();
var studentSinUpFirstNameController = TextEditingController();
var studentSinUpLastNameController = TextEditingController();
var studentSinUpEnglishFirstNameController = TextEditingController();
var studentSinUpEnglishLastNameController = TextEditingController();
String departmentName = '';
String className = '';
String teacherName = '';
int teacherId = 0;
String subjectName = '';

String studentNationalityVariable = '';
String studentSituationVariable = '';
String studentGenderVariable = '';
String certification = '';
String certificationDate = '';
String studentNoteCLassificationVariable = '';
int studentEditingNoteIdVariable = 0;
String studentEditingNoteCLassificationVariable = '';

//Teacher Auth Controllers
var postTextController = TextEditingController();
var editingPostTextController = TextEditingController();
var teacherAuthBirthDateController = TextEditingController();
var teacherAuthCertificationController = TextEditingController();
var teacherAuthSpecialtyController = TextEditingController();
var teacherAuthCurrentLocationController = TextEditingController();
var teacherAuthPermanentLocationController = TextEditingController();
var teacherAuthNationalityController = TextEditingController();
var teacherAuthNoteClassification = TextEditingController();
var teacherAuthNoteTitle = TextEditingController();
var teacherAuthNoteText = TextEditingController();
var teacherAuthCurrentPassword = TextEditingController();
var teacherAuthNewPassword = TextEditingController();
var teacherAuthConfirmPassword = TextEditingController();
var teacherAuthPrivacyEditingPhone = TextEditingController();
var teacherAuthPrivacyEditingLocation = TextEditingController();
var teacherAuthEditingNoteClassification = TextEditingController();
var teacherAuthEditingNoteTitle = TextEditingController();
var teacherAuthEditingNoteText = TextEditingController();
var teacherAuthSignInEmailController = TextEditingController();
var teacherAuthSignInPasswordController = TextEditingController();
var teacherAuthSignUpEmailController = TextEditingController();
var teacherAuthSignUpPasswordController = TextEditingController();
var teacherAuthSignUpPhoneController = TextEditingController();
var teacherAuthSinUpFirstNameController = TextEditingController();
var teacherAuthSinUpLastNameController = TextEditingController();
var teacherAuthSinUpEnglishFirstNameController = TextEditingController();
var teacherAuthSinUpEnglishLastNameController = TextEditingController();
var teacherAuthForgotPasswordEmailController = TextEditingController();
var teacherAuthForgotPasswordCodeController = TextEditingController();
var teacherAuthForgotPasswordNewPassword = TextEditingController();
var teacherAuthForgotPasswordConfirmPassword = TextEditingController();
String teacherAuthDepartmentVariable = '';
String teacherAuthNoteClassificationVariable = '';
String teacherAuthEditingNoteCLassificationVariable = '';
int teacherAuthEditingNoteIdVariable = 0;

//Teacher Controllers
var teacherBirthDateController = TextEditingController();
var teacherCertificationController = TextEditingController();
var teacherSpecialtyController = TextEditingController();
var teacherCurrentLocationController = TextEditingController();
var teacherPermanentLocationController = TextEditingController();
var teacherNationalityController = TextEditingController();
var teacherSignInEmailController = TextEditingController();
var teacherSignInPasswordController = TextEditingController();
var teacherSignUpEmailController = TextEditingController();
var teacherSignUpPasswordController = TextEditingController();
var teacherSignUpPhoneController = TextEditingController();
var teacherNoteClassification = TextEditingController();
var teacherNoteTitle = TextEditingController();
var teacherNoteText = TextEditingController();
var teacherForgotPasswordEmailController = TextEditingController();
var teacherForgotPasswordCodeController = TextEditingController();
var teacherForgotPasswordNewPassword = TextEditingController();
var teacherForgotPasswordConfirmPassword = TextEditingController();
var teacherCurrentPassword = TextEditingController();
var teacherNewPassword = TextEditingController();
var teacherConfirmPassword = TextEditingController();
var teacherSinUpFirstNameController = TextEditingController();
var teacherSinUpLastNameController = TextEditingController();
var teacherSinUpEnglishFirstNameController = TextEditingController();
var teacherSinUpEnglishLastNameController = TextEditingController();
var teacherPrivacyEditingPhone = TextEditingController();
var teacherPrivacyEditingLocation = TextEditingController();
var teacherEditingNoteClassification = TextEditingController();
var teacherEditingNoteTitle = TextEditingController();
var teacherEditingNoteText = TextEditingController();

String teacherNoteClassificationVariable = '';
String teacherEditingNoteClassificationVariable = '';
int teacherEditingNoteIdVariable = 0;
XFile? teacherProfileImageFile;
File? teacherProfileImagePath;
