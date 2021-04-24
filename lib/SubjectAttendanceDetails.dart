class SubjectAttendanceDetails {
  String subjectName;
  String subtitle;
  String status;
  int attended;
  int total;
  double percentage;

  SubjectAttendanceDetails(String subjectName, String subtitle, int attended, int total) {
    this.subjectName = subjectName;
    this.subtitle = subtitle;
    this.attended = attended;
    this.total = total;
    percentage = (attended / total) * 100;
  }
}