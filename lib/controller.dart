import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // TextEditingController mondayStartTimeController = TextEditingController();
  // TextEditingController mondayEndTimeController = TextEditingController();
  // TextEditingController tuesdayStartTimeController = TextEditingController();
  // TextEditingController tuesdayEndTimeController = TextEditingController();
  // TextEditingController wednesdayStartTimeController = TextEditingController();
  // TextEditingController wednesdayEndTimeController = TextEditingController();
  // TextEditingController thursdayStartTimeController = TextEditingController();
  // TextEditingController thursdayEndTimeController = TextEditingController();
  // TextEditingController fridayStartTimeController = TextEditingController();
  // TextEditingController fridayEndTimeController = TextEditingController();
  // TextEditingController saturdayStartTimeController = TextEditingController();
  // TextEditingController saturdayEndTimeController = TextEditingController();
  // TextEditingController sundayStartTimeController = TextEditingController();
  // TextEditingController sundayEndTimeController = TextEditingController();

  List<TextEditingController> startDateController =   <TextEditingController>[];
  List<TextEditingController> endDateController = <TextEditingController>[];

  RxList<String> day = <String>[
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ].obs;

  clearText(){
    startDateController.clear();
    endDateController.clear();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   // mondayStartTimeController.dispose();
  //   // mondayEndTimeController.dispose();
  //   // tuesdayStartTimeController.dispose();
  //   // tuesdayEndTimeController.dispose();
  //   // wednesdayStartTimeController.dispose();
  //   // wednesdayEndTimeController.dispose();
  //   // thursdayStartTimeController.dispose();
  //   // thursdayEndTimeController.dispose();
  //   // fridayStartTimeController.dispose();
  //   // fridayEndTimeController.dispose();
  //   // saturdayStartTimeController.dispose();
  //   // saturdayEndTimeController.dispose();
  //   // sundayStartTimeController.dispose();
  //   // sundayEndTimeController.dispose();
  //   super.dispose();
  // }
  //



  //
  // clearText() {
  //   mondayStartTimeController.clear();
  //   mondayEndTimeController.clear();
  //   tuesdayStartTimeController.clear();
  //   tuesdayEndTimeController.clear();
  //   wednesdayStartTimeController.clear();
  //   wednesdayEndTimeController.clear();
  //   thursdayStartTimeController.clear();
  //   thursdayEndTimeController.clear();
  //   fridayStartTimeController.clear();
  //   fridayEndTimeController.clear();
  //   saturdayStartTimeController.clear();
  //   saturdayEndTimeController.clear();
  //   sundayStartTimeController.clear();
  //   sundayEndTimeController.clear();
  // }

  //
  // List<NotesModel> amenitiesList = [];
  // addAmenities() {
  //   try {
  //     NotesModel amenities = NotesModel(
  //     endTime: mondayEndTimeController.text,
  //     startTime: mondayStartTimeController.text,
  //     day: "Monday"
  //     );
  //     amenitiesList.add(amenities);
  //     clearText();
  //     // Get.back();
  //   } catch (e, st) {
  //     print("error in addAmenities+++++++++++++++++$e $st");
  //   }
  // }



}

// List day = [
//   "Monday",
//   "Tuesday",
//   "Wednesday",
//   "Thursday",
//   "Friday",
//   "Saturday",
//   "Sunday",
// ];
