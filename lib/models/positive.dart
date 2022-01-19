class Positived {
  late int pid, doseno;
  late DateTime date;
  late bool completed;

  Positived(
      {required this.pid,
      this.doseno = 0,
      required this.date,
      required this.completed});
  Positived.simple() {
    pid = -1;
    doseno = 0;
    date = DateTime.now();
    completed = false;
  }
  Map<String, Object?> toMap() {
    return {
      'pid': pid,
      'doseno': doseno,
      'date': date.toString().substring(0, 10),
      'completedDose': completed.toString(),
    };
  }
}
