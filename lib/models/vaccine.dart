class Vaccine {
  late String name, company, country;
  late int noOfDoses;
  Vaccine({
    required this.company,
    required this.country,
    required this.name,
    required this.noOfDoses,
  });
  Vaccine.simple() {
    company = "";
    country = "";
    name = "";
    noOfDoses = 0;
  }
}
