import 'dart:convert';

class Students {
  List<Map<String, dynamic>> people;
  Students(this.people);

  void sort(String fieldName) {
    people.sort((a, b) => (a[fieldName] is int && b[fieldName] is int)
        ? (a[fieldName] as int).compareTo(b[fieldName] as int)
        : a[fieldName].toString().compareTo(b[fieldName].toString()));
    print('\nSorted by "$fieldName":');
    output();
  }

  void output() => people.forEach(print);

  void plus(Map<String, dynamic> person) {
    people.add(person);
    print('\nAfter adding new record:');
    output();
  }

  void remove(String fieldName) {
    people.removeWhere((person) => person.containsKey(fieldName));
    print('\nAfter removing items with "$fieldName":');
    output();
  }
}

void main() {
  String json = '''
  [
    {"id":1, "first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"id":2, "first":"Vladimir", "last":"Cezar", "email":"cezarv@algonquincollege.com"},
    {"id":3, "first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"id":4, "first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

  List<Map<String, dynamic>> people = List<Map<String, dynamic>>.from(jsonDecode(json));

  Students students = Students(people);
  print('Initial list:');
  students.output();

  students.sort('first');

  students.plus({
    "id": 5,
    "first": "Carson",
    "last": "Gao"
  });

  students.remove('email');
}