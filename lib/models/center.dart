class VacCenter {
  late String name, district, place;

  VacCenter({required this.name, required this.district, required this.place});
  VacCenter.simple() {
    name = '';
    district = '';
    place = '';
  }
}
