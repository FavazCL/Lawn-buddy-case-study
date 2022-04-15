import 'dart:convert';

import 'package:data/src/company_api/models/company.dart';

/// The interface for an [CompanyApi]
class CompanyApi {
  Future<List<Company>> getCompanies() async {
    return [];
  }
}

/// Exception thrown when locationSearch fails.
class LocationRequestFailure implements Exception {}

/// Exception thrown when getWeather fails.
class WeatherRequestFailure implements Exception {}
