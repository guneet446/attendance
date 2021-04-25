import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attendance/SubjectAttendanceDetails.dart';
import 'package:flutter/services.dart';

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
      margin: EdgeInsets.fromLTRB(25, 16, 25, 0),
      color: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Text(
                  widget.subject.subjectName + '\n' + widget.subject.subtitle + '\n',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.subject.attended.toString() + ' / ' + widget.subject.total.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.subject.status,
                ),
              ],
              ),
            ),

            Column(
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
                child: Container(
                  height: 70,
                  width: 70,
                  //padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: PieChart(
                    PieChartData(
                      sections: [PieChartSectionData(value: widget.subject.percentage, color: Colors.green, showTitle: false), PieChartSectionData(value: (100 - widget.subject.percentage), color: Colors.red, showTitle: false)],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 15, 0),
                child: Text(
                  (widget.subject.percentage.round()).toString() + "%",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            ),

            Column(
              children: <Widget>[
              IconButton(
                icon: Icon(Icons.check_circle, color: Colors.green, size: 27,),
                onPressed: () {
                  setState(() {
                    widget.subject.attended += 1;
                    widget.subject.total += 1;
                    widget.subject.percentage = (widget.subject.attended / widget.subject.total) * 100;
                    if(widget.subject.percentage == 100) {
                      widget.subject.percentage = 99.99;
                    }
                    setAttendanceStatus();
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.cancel, color: Colors.red, size: 27,),
                onPressed: () {
                  setState(() {
                    widget.subject.total += 1;
                    widget.subject.percentage = (widget.subject.attended / widget.subject.total) * 100;
                    if(widget.subject.percentage == 100) {
                      widget.subject.percentage = 99.99;
                    }
                    else if(widget.subject.attended == 0) {
                      widget.subject.percentage = 00.01;
                    }
                    setAttendanceStatus();
                  });
                },
              ),
              IconButton(
                onPressed: () {
                  return showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title: Text(widget.subject.subjectName + " " + widget.subject.subtitle),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              editSelectedAttendanceCard();
                            },
                            child: Text("Edit")
                        ),
                        TextButton(
                            onPressed: () {
                              deleteSelectedAttendanceCard();
                              Navigator.pop(context);
                            },
                            child: Text("Delete")
                        ),
                      ],
                    );
                  });
                },
                icon: Icon(Icons.edit, color: Colors.blue, size: 25,),
              ),
            ],
            ),
          ],
        ),
      ),
    );
  }
  editSelectedAttendanceCard() {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 25,
              child: TextFormField(
                initialValue: widget.subject.attended.toString(),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  widget.subject.attended = int.parse(value);
                },
              ),
            ),
            Text(" / "),
            Container(
              width: 25,
              child: TextFormField(
                initialValue: widget.subject.total.toString(),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  widget.subject.total = int.parse(value);
                },
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  widget.subject.percentage = (widget.subject.attended / widget.subject.total) * 100;
                });
                Navigator.pop(context);
              },
              child: Text('Submit'),
          ),
        ],
      );
    }
    );
  }

  deleteSelectedAttendanceCard() {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Delete ${widget.subject.subjectName} ${widget.subject.subtitle}?'),
        actions: <Widget>[
          new TextButton(
              child: new Text('Cancel'),
              onPressed: () => Navigator.of(context).pop()
          ),
          new TextButton(
            child: new Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop();
              subjects.remove(widget.subject);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>
                    Attendance()),
              );
            },
          ),
        ],
      );
    });
  }
  
  setAttendanceStatus() {
    int canMiss = 0;
    int shouldAttend = 0;
    if(widget.subject.percentage >= 75) {
      widget.subject.status = "You are safe";
      canMiss = (((4/3) * widget.subject.attended) - widget.subject.total).toInt();
    }
    if(canMiss > 0) {
      widget.subject.status = "You can miss the next $canMiss classes";
    }
    if(widget.subject.percentage < 75) {
      shouldAttend = 3 * widget.subject.total - 4 * widget.subject.attended;
      widget.subject.status = "Don't miss the next $shouldAttend classes";
    }
  }
}
