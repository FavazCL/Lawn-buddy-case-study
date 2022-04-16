part of 'company_bloc.dart';

enum CompanyStatus { initial, loading, success, failure }

class CompanyState extends Equatable {
  const CompanyState({
    this.companies = const [],
    this.status = CompanyStatus.initial,
  });

  final List<Company> companies;
  final CompanyStatus status;

  CompanyState copyWith({
    List<Company>? companies,
    CompanyStatus? status,
  }) {
    return CompanyState(
      status: status ?? this.status,
      companies: companies ?? this.companies,
    );
  }

  @override
  List<Object?> get props => [
        status,
        companies,
      ];
}
