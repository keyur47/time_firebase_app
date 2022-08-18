import 'package:cloud_firestore/cloud_firestore.dart';

class NotesModel {
  String? day;
  String? startTime;
  String? endTime;

  NotesModel(
      { this.day, this.startTime, this.endTime,});

  NotesModel.fromMap(DocumentSnapshot data) {
    day = data['day'];
    startTime = data['startTime'];
    endTime = data['endTime'];
  }
}
