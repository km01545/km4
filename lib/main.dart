import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rakna_graduation_project/config/constants/application_theme_manger.dart';
import 'package:rakna_graduation_project/pages/Datails/pages/tickets_page.dart';
import 'package:rakna_graduation_project/pages/History/pages/history.dart';
import 'package:rakna_graduation_project/pages/MENU/pages/menu.dart';
import 'package:rakna_graduation_project/pages/Report/pages/report_page.dart';
import 'package:rakna_graduation_project/pages/SignIn/pages/sign_in_page.dart';
import 'package:rakna_graduation_project/pages/profile/pages/profile_page.dart';
import 'package:rakna_graduation_project/layout_view.dart';
import 'package:rakna_graduation_project/pages/reserve/pages/reservation_parking.dart';
import 'package:rakna_graduation_project/setting_provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingProvider(),
      child: const Rakna(),
    ),
  );
}

class Rakna extends StatelessWidget {
  const Rakna({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ApplicationThemeManager.applicationThemeData,
      themeMode: ThemeMode.light,
      initialRoute: LayoutView.routName,
      routes: {
        // SplashView.routName: (context) => const SplashView(),
        LayoutView.routName: (context) => const LayoutView(),
        Tickets.routName: (context) => const Tickets(),
        Reservation.routName: (context) => const Reservation(),
        ProfilePage.routName: (context) => const ProfilePage(),
        HistoryPage.routName: (context) => const HistoryPage(),
        MenuDrower.routName: (context) => const MenuDrower(),
        ReportPage.routName: (context) => const ReportPage(),
        LogInPage.routName: (context) => const LogInPage(),
      },
    );
  }
}
