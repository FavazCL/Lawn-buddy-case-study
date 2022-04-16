import 'package:data/data.dart';

/// A repository that handles weather related requests.
class CompanyRepository {
  /// Constructor of [CompanyRepository] class
  CompanyRepository({
    CompanyApi? companyApi,
  }) : _companyApi = companyApi ?? CompanyApi();

  final CompanyApi _companyApi;

  Future<List<Company>> getCompanies() async {
    final companies = await _companyApi.getCompanies();
    return companies;
  }
}
