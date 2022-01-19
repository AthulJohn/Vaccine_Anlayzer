class VacCenter {
  late String name, district, place, sector;

  VacCenter({required this.name, required this.district, required this.place});
  VacCenter.simple() {
    name = '';
    district = '';
    place = '';
    sector = '';
  }
  Map<String, Object?> toMap() {
    return {
      'name': name,
      'district': district,
      'place': place,
      'sector': sector,
    };
  }
}
