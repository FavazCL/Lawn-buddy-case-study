import 'dart:convert';

import 'package:data/src/company_api/models/company.dart';
import 'package:flutter/services.dart';

/// The interface for an [CompanyApi]
class CompanyApi {
  Future<List<Company>> getCompanies() async {
    final response =
        await rootBundle.loadString('assets/data/company_data.json');
    final responseParsed = jsonDecode(response) as List<dynamic>;
    return responseParsed
        .map((dynamic company) =>
            Company.fromJson(company as Map<String, dynamic>))
        .toList();
  }
}
