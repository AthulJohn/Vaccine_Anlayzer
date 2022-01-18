class Vaccination {
  late String pid, vid, doseno;
  late DateTime date;
  Vaccination(
      {required this.pid,
      required this.vid,
      required this.date,
      required this.doseno});
  Vaccination.simple() {
    pid = '';
    vid = '';
    date = DateTime.now();
    doseno = '';
  }
}
