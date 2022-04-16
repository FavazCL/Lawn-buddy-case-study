import 'package:cached_network_image/cached_network_image.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.employee,
    required this.onTap,
  }) : super(key: key);

  final Employee employee;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: CachedNetworkImage(
                    imageUrl: employee.avatar,
                    height: 50,
                    errorWidget: (BuildContext _, String __, dynamic ___) =>
                        const Icon(Icons.error),
                  ),
                ),
                Column(
                  children: [
                    Text('${employee.lastName}, ${employee.firstName}'),
                    Text(employee.email),
                  ],
                )
              ],
            ),
            Text(employee.company.companyName),
          ],
        ),
      ),
    );
  }
}
