import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeState> {
  EmployeeBloc({
    required EmployeeRepository employeeRepository,
  })  : _employeeRepository = employeeRepository,
        super(const EmployeState()) {
    on<EmployeeRequested>(_onEmployeeRequested);
    on<EmployeesFiltered>(_onEmployeesFiltered);
    on<EmployeesFilteredByCompany>(_onEmployeesFilteredByCompany);
    on<FilterCleared>(_onFilterCleared);
  }

  final EmployeeRepository _employeeRepository;

  Future<void> _onEmployeeRequested(
    EmployeeRequested event,
    Emitter<EmployeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: EmployeeStatus.loading));
      final response = await _employeeRepository.getEmployees();

      emit(
        state.copyWith(
          status: EmployeeStatus.success,
          employees: response,
          employeesFiltered: response,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: EmployeeStatus.failure));
    }
  }

  Future<void> _onEmployeesFiltered(
    EmployeesFiltered event,
    Emitter<EmployeState> emit,
  ) async {
    if (event.value.isEmpty) {
      emit(state.copyWith(employeesFiltered: state.employees));
    }

    final filtered = state.employees
        .where(
          (employe) =>
              employe.firstName.contains(event.value) ||
              employe.lastName.contains(event.value),
        )
        .toList();

    emit(state.copyWith(employeesFiltered: filtered));
  }

  Future<void> _onEmployeesFilteredByCompany(
    EmployeesFilteredByCompany event,
    Emitter<EmployeState> emit,
  ) async {
    final filtered = state.employees
        .where(
          (employe) => employe.company.id == event.companyId,
        )
        .toList();

    emit(state.copyWith(employeesFiltered: filtered));
  }

  Future<void> _onFilterCleared(
    FilterCleared event,
    Emitter<EmployeState> emit,
  ) async {
    emit(state.copyWith(employeesFiltered: state.employees));
  }
}
