class Person {
  late String name, gender, phone, district;
  late int age;
  Person(
      {required this.name,
      required this.age,
      required this.gender,
      required this.district,
      required this.phone});
  Person.simple() {
    name = '';
    gender = '';
    district = '';
    phone = '';
    age = 0;
  }
}
