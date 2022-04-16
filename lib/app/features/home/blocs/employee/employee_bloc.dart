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
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: EmployeeStatus.failure));
    }
  }
}
