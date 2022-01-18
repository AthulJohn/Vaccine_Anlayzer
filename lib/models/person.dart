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

  Map<String, Object?> toMap() {
    return {
      'name': name,
      'gender': gender,
      'district': district,
      'phone': phone,
      'age': age
    };
  }
}
