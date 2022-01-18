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
  Map<String, Object?> toMap() {
    return {
      'name': name,
      'company': company,
      'country': country,
      'noOfDoses': noOfDoses,
    };
  }
}
