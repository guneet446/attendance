class SubjectAttendance {
  String subjectName;
  String status;
  int attended;
  int total;
  double percentage;

  SubjectAttendance(String subjectName, int attended, int total) {
    this.subjectName = subjectName;
    this.attended = attended;
    this.total = total;
    percentage = (attended / total) * 100;
  }
}