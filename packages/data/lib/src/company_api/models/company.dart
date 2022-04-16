class Company {
  Company({
    required this.id,
    required this.companyName,
    required this.contactFirstName,
    required this.contactLastName,
    required this.email,
  });

  final int id;
  final String companyName;
  final String contactFirstName;
  final String contactLastName;
  final String email;

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'] as int,
      companyName: json['company_name'] as String,
      contactFirstName: json['contact_first_name'] as String,
      contactLastName: json['contact_last_name'] as String,
      email: json['email'] as String,
    );
  } 

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'company_name': companyName,
      'contact_first_name': contactFirstName,
      'contact_last_name': contactLastName,
      'email': email,
    };
  }
}
