import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawn_budy_case_study/app/features/home/blocs/company/company_bloc.dart';
import 'package:lawn_budy_case_study/app/features/home/blocs/employee/employee_bloc.dart';

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
          body: SingleChildScrollView(
            child: Column(
                children: [
                  ListView.builder(
                    itemCount: state.employees.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final employee = state.employees[index];

                      return Container(
                        height: 100,
                        color: Colors.red,
                        child: Text(employee.firstName),
                      );
                    },
                  ),
                ],
              ),
            ),
        );
      },
    );
  }
}
