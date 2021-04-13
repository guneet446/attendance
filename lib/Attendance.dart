import 'package:attendance/AttendanceCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SubjectAttendanceDetails.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

List<SubjectAttendanceDetails> subjects = [SubjectAttendanceDetails("Machine Learning", 12, 15), SubjectAttendanceDetails("Operating Systems", 5, 15), SubjectAttendanceDetails("Python", 17, 17)];

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
        ),
      ),
      /*bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(26,10,26,10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Total = Rs ' + total.toString(),
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),),
              RaisedButton(
                onPressed: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Confirm())
                  );
                },
                elevation: 8,
                color: Color(0xffF2CC8F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Pacifico',
                    color: Color(0xff3D405B),
                  ),
                ),
              ),
            ],
          ),
        ),
        color: Color(0xffe29578),
      ),*/
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return AttendanceCard(
            subject: subjects[index],
            /*updateTotal: () {
              setState(() {
                foods.forEach((food) {total += food.amount;});
              });
            },*/
          );
        },
      ),
    );
  }
}
