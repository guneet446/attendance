import 'package:attendance/AttendanceCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SubjectAttendanceDetails.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

List<SubjectAttendanceDetails> subjects = [];

class _AttendanceState extends State<Attendance> {
  String subjectName = "EAD";
  String subtitle = "Lecture";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: PreferredSize(preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Text('My Attendance', style: TextStyle( color: Colors.white, fontSize: 35,),),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          actions: [
            TextButton(
              child: Icon(Icons.add, color: Colors.white,),
              onPressed: () {
                _getSubject(context);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return AttendanceCard(
            subject: subjects[index],
          );
        },
      ),
    );
  }

  final myController = TextEditingController();

  _getSubject(BuildContext context) {
    List<String> subjectList = ['Machine Learning', 'Operating Systems', 'Computer Networks', 'DBMS', 'EAD'];
    List<String> subtitleList = ['Lecture', 'Tutorial', 'Lab'];
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Subject"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // for dropdown to open in correct direction go to dropdown.dart and set selectedItemOffset to -40
            DropdownButton<String>(
              value: subjectName,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 35,
              elevation: 16,
              //style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                //color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  subjectName = newValue;
                });
                //_setSubject(newValue);
              },
              items: subjectList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            DropdownButton<String>(
              value: subtitle,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  subtitle = newValue;
                });
                //_setSubject(newValue);
              },
              items: subtitleList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextButton(
              onPressed:() {
                Navigator.pop(context);
                _setSubject();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      );
    });
  }

  void _setSubject() {
    setState(() {
      subjects.add(SubjectAttendanceDetails(subjectName, subtitle, 0, 0));
    });
  }
}
