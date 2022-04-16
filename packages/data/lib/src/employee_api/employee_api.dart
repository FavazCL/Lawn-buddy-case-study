import 'dart:convert';

import 'package:data/src/company_api/models/company.dart';
import 'package:data/src/employee_api/models/employee.dart';
import 'package:flutter/services.dart';

/// The interface for an [EmployeeApi]
class EmployeeApi {
  Future<List<Employee>> getEmployees(List<Company> companies) async {
    final response =
        await rootBundle.loadString('assets/data/employee_data.json');
    final responseParsed = jsonDecode(response) as List<Map<String, dynamic>>;

    return responseParsed.map((employee) {
      employee['company_id'] =
          getCurrentCompany(employee['company_id'] as int, companies);
      return Employee.fromJson(employee);
    }).toList();
  }

  Map<String, dynamic> getCurrentCompany(
      int companyId, List<Company> companies) {
    return companies.firstWhere((company) => company.id == companyId).toJson();
  }
}
