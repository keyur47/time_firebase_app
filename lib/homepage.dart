import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_firebase_app/controller.dart';
import 'package:time_firebase_app/customTextField_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeController homeController = Get.put(HomeController());

  CollectionReference students =
      FirebaseFirestore.instance.collection("students");

  Future<void> addUser() {
    print("User Added");
    return students
        .add({
          'day': day,
          'startTime': startTime,
          'endTime': endTime,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to Add user: $error"));
  }

  var day = "";

  var startTime = "";

  var endTime = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMyDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Add Select Time Data"),
      ),
    );
  }

  void showMyDialog(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content:


              SizedBox(
            height: 450,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Container(
                                child: Text("Day")),
                          ],
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Center(child: Container(child: Text("Start"))),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Container(child: Text("End")),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: homeController.day.length,
                    itemBuilder: (context, index) {
                      homeController.startDateController
                          .add(TextEditingController());
                      homeController.endDateController
                          .add(TextEditingController());
                      return Column(
                        children: [
                          Button(
                            day: homeController.day[index],
                            startTimeController:
                                homeController.startDateController[index],
                            endTimeController:
                                homeController.endDateController[index],
                            startTimeOnTap: () async {
                              var time = await showTimePicker(
                                initialTime: TimeOfDay.now(),
                                context: context,
                              );
                              homeController.startDateController[index].text =
                                  time!.format(context);
                            },
                            endTimeOnTap: () async {
                              var time = await showTimePicker(
                                initialTime: TimeOfDay.now(),
                                context: context,
                              );
                              homeController.endDateController[index].text =
                                  time!.format(context);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple, // Sets color for all the descendent ElevatedButtons
              ),
              child: const Text('Submit'),
              onPressed: () async {
                for (var i = 0; i < homeController.day.length; i++) {
                  day = homeController.day[i];
                  print(day);
                  setState(() {
                    startTime = homeController.startDateController[i].text;
                    print(startTime);
                  });
                  setState(() {
                    endTime = homeController.endDateController[i].text;
                    print(endTime);
                  });
                  if (homeController.startDateController[i].text != "" &&
                      homeController.endDateController[i].text != "") {
                    addUser();
                  }
                }
                homeController.clearText();
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  Widget Button({required String day,
      required TextEditingController startTimeController,
      required TextEditingController endTimeController,
      required VoidCallback? startTimeOnTap,
      required VoidCallback? endTimeOnTap}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(day),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            child: Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomeTextField(
                  hintStyle: const TextStyle(fontSize: 14, color: Colors.red),
                  controller: startTimeController,
                  maxLine: 1,
                  readOnly: true,
                  onTap: startTimeOnTap,
                ),
              ],
            )),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomeTextField(
                    hintStyle: const TextStyle(fontSize: 14, color: Colors.red),
                    readOnly: true,
                    onTap: endTimeOnTap,
                    controller: endTimeController,
                    maxLine: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
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


// ListView(
//   children: [
//     Button(
//       day: "Monday",
//       startTimeController: homeController.mondayStartTimeController,
//       endTimeController: homeController.mondayEndTimeController,
//       startTimeOnTap: () async {
//         var time =  await showTimePicker(
//         initialTime: TimeOfDay.now(),
//         context: context,);
//         homeController.mondayStartTimeController.text = time!.format(context);
//       },
//       endTimeOnTap: ()async {
//           var time =  await showTimePicker(
//             initialTime: TimeOfDay.now(),
//             context: context,);
//           homeController.mondayEndTimeController.text = time!.format(context);
//       },
//     ),
//     const SizedBox(
//       height: 10,
//     ),
//     Button(
//       day: "Tuesday",
//       startTimeController: homeController.tuesdayStartTimeController,
//       endTimeController: homeController.tuesdayEndTimeController,
//       startTimeOnTap: () {},
//       endTimeOnTap: () {},
//     ),
//     const SizedBox(
//       height: 10,
//     ),
//     Button(
//       day: "Wednesday",
//       startTimeController:
//           homeController.wednesdayStartTimeController,
//       endTimeController: homeController.wednesdayEndTimeController,
//       startTimeOnTap: () {},
//       endTimeOnTap: () {},
//     ),
//     const SizedBox(
//       height: 10,
//     ),
//     Button(
//       day: "Thursday",
//       startTimeController: homeController.thursdayStartTimeController,
//       endTimeController: homeController.thursdayEndTimeController,
//       startTimeOnTap: () {},
//       endTimeOnTap: () {},
//     ),
//     const SizedBox(
//       height: 10,
//     ),
//     Button(
//       day: "Friday",
//       startTimeController: homeController.fridayStartTimeController,
//       endTimeController: homeController.fridayEndTimeController,
//       startTimeOnTap: () {},
//       endTimeOnTap: () {},
//     ),
//     const SizedBox(
//       height: 10,
//     ),
//     Button(
//       day: "Saturday",
//       startTimeController: homeController.saturdayStartTimeController,
//       endTimeController: homeController.saturdayEndTimeController,
//       startTimeOnTap: () {},
//       endTimeOnTap: () {},
//     ),
//     const SizedBox(
//       height: 10,
//     ),
//     Button(
//       day: "Sunday",
//       startTimeController: homeController.sundayStartTimeController,
//       endTimeController: homeController.sundayEndTimeController,
//       startTimeOnTap: () {},
//       endTimeOnTap: () {},
//     ),
//     const SizedBox(
//       height: 10,
//     ),
//   ],
// ),


List<Map<String, String>> myData = [
  {'day': 'Monday', 'startTime': '', 'endTime': ''},
  {'day': 'Tuesday', 'startTime': '', 'endTime': ''},
  {'day': 'Wednesday', 'startTime': '', 'endTime': ''},
  {'day': 'Thursday', 'startTime': '', 'endTime': ''},
  {'day': 'Friday', 'startTime': '', 'endTime': ''},
  {'day': 'Saturday', 'startTime': '', 'endTime': ''},
  {'day': 'Sunday', 'startTime': '', 'endTime': ''},
];

List<Map> allData = [
  {
    "day": "Monday",
    "startTime": "",
    "endTime": "",
  },
  {
    "day": "Monday",
    "startTime": "",
    "endTime": "",
  },
  {
    "day": "Monday",
    "startTime": "",
    "endTime": "",
  },
  {
    "day": "Monday",
    "startTime": "",
    "endTime": "",
  },
  {
    "day": "Monday",
    "startTime": "",
    "endTime": "",
  },
  {
    "day": "Monday",
    "startTime": "",
    "endTime": "",
  },
  {
    "day": "Monday",
    "startTime": "",
    "endTime": "",
  },
];
