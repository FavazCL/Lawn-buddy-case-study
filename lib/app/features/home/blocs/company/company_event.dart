part of 'company_bloc.dart';

abstract class CompanyEvent extends Equatable {
  const CompanyEvent();

  @override
  List<Object> get props => [];
}

class CompanyRequested extends CompanyEvent {
  const CompanyRequested();
}
