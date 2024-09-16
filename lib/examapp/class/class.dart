import 'dart:io';

class Contact {
  File image;
  String name;
  int id;
  int std;
  Contact({
    required this.image,
    required this.name,
    required this.id,
    required this.std,
  });
}

List<Contact> allStudent = [];
