import 'package:flutter/material.dart';
import 'package:rakna_graduation_project/config/constants/application_theme_manger.dart';

class DashBordPage extends StatelessWidget {
  const DashBordPage({super.key});
  static const String routName = "DashBordPage";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ApplicationThemeManager.prymaryColor,
      body: Center(
        child: Text(
          "DashBordPage",
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
