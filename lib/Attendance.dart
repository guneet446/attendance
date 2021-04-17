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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: PreferredSize(preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Text('My Attendance', style: TextStyle( color: Colors.white, fontSize: 40,),),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          actions: [
            TextButton(
              child: Icon(Icons.add),
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

  _getSubject(BuildContext context) async{
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Subject"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: myController,
              decoration: InputDecoration(
                  labelText: 'Subject'
              ),
              validator: (val) {
                return val.isEmpty ? 'Enter the subject name' : null;
              },
            ),
            TextButton(
              onPressed: _setSubject,
              child: Text('Submit'),
            ),
          ],
        ),
      );
    });
  }

  void _setSubject() {
    setState(() {
      subjects.add(SubjectAttendanceDetails(myController.text, 1, 2));
    });
  }
}
