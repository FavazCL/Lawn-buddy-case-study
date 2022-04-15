import 'package:data/src/company_api/models/company.dart';

class Employee {
  Employee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar,
    required this.company,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;
  final Company company;
}
