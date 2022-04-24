class Person {
  final String name;
  final String lastName;
  final DateTime? dateOfBirth;
  // final Face? avatar;

  Person({
    required this.name,
    required this.lastName,
    this.dateOfBirth,
  });

  Person.johnDoe()
      : name = 'John',
        lastName = 'Doe',
        dateOfBirth = DateTime(1996, 3, 22);
}
