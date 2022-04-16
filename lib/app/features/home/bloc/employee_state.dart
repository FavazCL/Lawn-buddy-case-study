part of 'employee_bloc.dart';

enum EmployeeStatus { initial, loading, success, failure }

class EmployeState extends Equatable {
  const EmployeState({
    this.employees = const [],
    this.currentEmployee,
    this.status = EmployeeStatus.initial,
  });

  final List<Employee> employees;
  final Employee? currentEmployee;
  final EmployeeStatus status;

  EmployeState copyWith({
    List<Employee>? employees,
    Employee? currentEmployee,
    EmployeeStatus? status,
  }) {
    return EmployeState(
      status: status ?? this.status,
      employees: employees ?? this.employees,
      currentEmployee: currentEmployee ?? this.currentEmployee,
    );
  }

  @override
  List<Object?> get props => [
        status,
        employees,
        currentEmployee,
      ];
}
