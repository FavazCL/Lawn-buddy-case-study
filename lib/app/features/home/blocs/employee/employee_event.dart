part of 'employee_bloc.dart';

@immutable
abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class EmployeeRequested extends EmployeeEvent {
  const EmployeeRequested();
}
