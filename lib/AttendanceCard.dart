import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Attendance.dart';
import 'package:attendance/SubjectAttendanceDetails.dart';

class AttendanceCard extends StatefulWidget {
  final SubjectAttendanceDetails subject;
  //final Function updateTotal;
  AttendanceCard({this.subject});

  @override
  _AttendanceCardState createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(36, 16, 36, 0),
      color: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.subject.subjectName,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                  ),
                ),
                ButtonBar(
                  //buttonMinWidth: 20,
                  buttonHeight: 25,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.check_circle, color: Colors.green,),
                      onPressed: () {
                        setState(() {
                          widget.subject.attended += 1;
                          widget.subject.total += 1;
                          //widget.food.amount = widget.food.rate * widget.food.quantity;
                          //widget.updateTotal();
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.cancel, color: Colors.red,),
                      onPressed: () {
                        setState(() {
                          widget.subject.total += 1;
                          //widget.food.amount = widget.food.rate * widget.food.quantity;
                          //widget.updateTotal();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            //SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.subject.attended.toString() + ' / ' + widget.subject.total.toString(),
                ),
              ],
            ),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Rs ' + widget.food.rate.toString(),
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xffE07A5F),
                  ),
                ),
                Text(
                  'Rs ' + widget.food.amount.toString(),
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xffE07A5F),
                  ),
                ),
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}
