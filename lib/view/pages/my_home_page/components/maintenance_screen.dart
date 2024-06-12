import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
        alignment: Alignment.center,
        child: Text(
          'メンテナンス中です',
          style: TextStyle(fontSize: 25.0),
        ));
  }
}
