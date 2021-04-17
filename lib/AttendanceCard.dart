import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attendance/SubjectAttendanceDetails.dart';
import 'Attendance.dart';

class AttendanceCard extends StatefulWidget {
  final SubjectAttendanceDetails subject;

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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  //padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: PieChart(
                    PieChartData(
                      sections: [PieChartSectionData(value: widget.subject.percentage, color: Colors.green, showTitle: false), PieChartSectionData(value: (100 - widget.subject.percentage), color: Colors.red, showTitle: false)],
                    ),
                  ),
                ),
              ],
            ),
            //SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.subject.attended.toString() + ' / ' + widget.subject.total.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold,),
                ),
                ButtonBar(
                  //buttonMinWidth: 20,
                  buttonHeight: 25,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.check_circle, color: Colors.green, size: 35,),
                      onPressed: () {
                        setState(() {
                          widget.subject.attended += 1;
                          widget.subject.total += 1;
                          widget.subject.percentage = (widget.subject.attended / widget.subject.total) * 100;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.cancel, color: Colors.red, size: 35,),
                      onPressed: () {
                        setState(() {
                          widget.subject.total += 1;
                          widget.subject.percentage = (widget.subject.attended / widget.subject.total) * 100;
                        });
                      },
                    ),
                  ],
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
