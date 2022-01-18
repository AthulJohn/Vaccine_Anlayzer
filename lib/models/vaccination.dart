class Vaccination {
  late int pid, vid, cid, doseno;
  late DateTime date;
  Vaccination(
      {required this.pid,
      required this.vid,
      required this.date,
      required this.doseno});
  Vaccination.simple() {
    pid = 0;
    vid = 0;
    date = DateTime.now();
    doseno = 0;
    cid = 0;
  }
  Map<String, Object?> toMap() {
    return {
      'pid': pid,
      'vid': vid,
      'cid': cid,
      'date': date.toString().substring(0, 10),
      'doseno': doseno,
    };
  }
}
