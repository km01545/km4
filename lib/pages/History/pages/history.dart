import 'package:flutter/material.dart';
import 'package:rakna_graduation_project/config/constants/application_theme_manger.dart';
import 'package:rakna_graduation_project/config/widgets/custom_arrow_back.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});
  static const String routName = "HistoryPage";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ApplicationThemeManager.prymaryColor,
      child: const Column(
        children: [
          CustomArrowBack(
            title: "History",
          )
        ],
      ),
    );
  }
}
