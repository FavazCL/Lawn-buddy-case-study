import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  CompanyBloc({
    required CompanyRepository companyRepository,
  }) : _companyRepository = companyRepository, super(const CompanyState()) {
    on<CompanyRequested>(_onCompanyRequested);
  }

  final CompanyRepository _companyRepository;

  Future<void> _onCompanyRequested(
    CompanyRequested event,
    Emitter<CompanyState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CompanyStatus.loading));
      final response = await _companyRepository.getCompanies();

      emit(
        state.copyWith(
          status: CompanyStatus.success,
          companies: response,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: CompanyStatus.failure));
    }
  }
}
