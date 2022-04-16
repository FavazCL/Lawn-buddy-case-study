import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawn_budy_case_study/app/features/home/blocs/company/company_bloc.dart';
import 'package:lawn_budy_case_study/app/features/home/blocs/employee/employee_bloc.dart';
import 'package:lawn_budy_case_study/app/features/home/view/company_details_page.dart';
import 'package:ui_kit/ui_kit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EmployeeBloc(
            employeeRepository: context.read<EmployeeRepository>(),
          )..add(const EmployeeRequested()),
        ),
        BlocProvider(
          create: (context) => CompanyBloc(
            companyRepository: context.read<CompanyRepository>(),
          )..add(const CompanyRequested()),
        ),
      ],
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Case study'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  CustomInputField(
                    onChanged: (value) {
                      context
                          .read<EmployeeBloc>()
                          .add(EmployeesFiltered(value));
                    },
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.employeesFiltered.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final employee = state.employeesFiltered[index];

                      return UserCard(
                        employee: employee,
                        onTap: () {
                          context.read<EmployeeBloc>().add(
                                EmployeesFilteredByCompany(employee.company.id),
                              );

                          Navigator.push<CompanyDetailsPage>(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider<EmployeeBloc>.value(
                                value: BlocProvider.of<EmployeeBloc>(
                                  context,
                                ),
                                child: CompanyDetailsPage(
                                  company: employee.company,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
