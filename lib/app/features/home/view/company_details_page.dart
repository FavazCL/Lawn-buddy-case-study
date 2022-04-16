import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawn_budy_case_study/app/features/home/blocs/employee/employee_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

class CompanyDetailsPage extends StatelessWidget {
  const CompanyDetailsPage({
    Key? key,
    required this.company,
  }) : super(key: key);

  final Company company;

  @override
  Widget build(BuildContext context) {
    return CompanyDetailsView(company: company);
  }
}

class CompanyDetailsView extends StatelessWidget {
  const CompanyDetailsView({
    Key? key,
    required this.company,
  }) : super(key: key);

  final Company company;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add))
            ],
            title: const Text('Company Details'),
            leading: BackButton(
              onPressed: () {
                context.read<EmployeeBloc>().add(const FilterCleared());
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text(
                    company.companyName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Contact Name: ${company.contactLastName}, ${company.contactFirstName}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Email: ${company.email}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomInputField(
                    onChanged: (value) {
                      // TODO: FILTERED
                    },
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    itemCount: state.employeesFiltered.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final employee = state.employeesFiltered[index];

                      return UserCard(
                        employee: employee,
                        onTap: () {},
                        showCompanyName: false,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
