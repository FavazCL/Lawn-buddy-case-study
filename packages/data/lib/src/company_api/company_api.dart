import 'dart:convert';

import 'package:data/src/company_api/models/company.dart';
import 'package:flutter/services.dart';

/// The interface for an [CompanyApi]
class CompanyApi {
  Future<List<Company>> getCompanies() async {
    final response =
        await rootBundle.loadString('assets/data/company_data.json');
    final responseParsed = jsonDecode(response) as List<Map<String, dynamic>>;
    return responseParsed.map(Company.fromJson).toList();
  }
}
