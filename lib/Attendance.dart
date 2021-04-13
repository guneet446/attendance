import 'package:flutter/cupertino.dart';
import 'SubjectAttendanceDetails.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

List<SubjectAttendanceDetails> subject = [SubjectAttendanceDetails("Machine Learning", 12, 15), SubjectAttendanceDetails("Operating Systems", 5, 15), SubjectAttendanceDetails("Python", 17, 17)];

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
