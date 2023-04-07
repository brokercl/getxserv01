import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/entities/payment.dart';
import 'package:gtxserv01/ui/manager_bottom.dart';
import 'package:gtxserv01/ui/student_bottom.dart';

import '../entities/user.dart';
import '../services/user/auth_service.dart';

class PaymentsTable extends StatelessWidget {
  final List<Payment> payments;
  User? get currentUser => Get.find<AuthService>().currentUser;

  const PaymentsTable({super.key, required this.payments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: dataTable(payments),
        bottomNavigationBar: currentUser!.role == Rol.admin ||
                currentUser!.role == Rol.manager
            // Rol.admin && Rol.manager use same forms diferrence in status and rols
            ? ManagerBottom()
            : StudentBottom());
  }
}

dataTable(List<Payment> payments) => DataTable(
      columns: const [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Num Cuota')),
        DataColumn(label: Text('Value Cuota')),
        DataColumn(label: Text('Status Payment')),
      ],
      rows: payments
          .map(
            (payment) => DataRow(
              cells: [
                DataCell(Text(payment.id.toString())),
                DataCell(Text(payment.numCuota.toString())),
                DataCell(Text(payment.valueCuota.toString())),
                DataCell(Text(payment.paymentStatus.toString())),
              ],
            ),
          )
          .toList(),
    );
