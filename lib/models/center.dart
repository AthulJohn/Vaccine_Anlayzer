class VacCenter {
  late String name, district, place;

  VacCenter({required this.name, required this.district, required this.place});
  VacCenter.simple() {
    name = '';
    district = '';
    place = '';
  }
  Map<String, Object?> toMap() {
    return {
      'name': name,
      'district': district,
      'place': place,
    };
  }
}
