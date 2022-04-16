import 'package:data/data.dart';

/// A repository that handles weather related requests.
class EmployeeRepository {
  /// Constructor of [EmployeeRepository] class
  EmployeeRepository({
    EmployeeApi? employeeApi,
    CompanyApi? companyApi,
  })  : _employeeApi = employeeApi ?? EmployeeApi(),
        _companyApi = companyApi ?? CompanyApi();

  final EmployeeApi _employeeApi;
  final CompanyApi _companyApi;

  Future<List<Employee>> getEmployees() async {
    final companies = await _companyApi.getCompanies();
    final employees = await _employeeApi.getEmployees(companies);
    return employees;
  }
}
