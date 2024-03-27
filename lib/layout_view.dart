import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rakna_graduation_project/config/constants/constants.dart';
import 'package:rakna_graduation_project/pages/MENU/pages/menu.dart';
import 'package:rakna_graduation_project/pages/MENU/widgets/custom_appbar.dart';
import 'package:rakna_graduation_project/setting_provider.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});
  static String routName = "LayoutView";

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Constants.mediaQuery * 0.1,
        child: const CustomAppBar(),
      ),
      drawer: const MenuDrower(),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: const Color(0xffF8A00E),
        backgroundColor: const Color(0xff5B5B5B),
        color: const Color(0xff2A2A2A),
        animationDuration: const Duration(milliseconds: 400),
        onTap: vm.changeIndex,
        items: const [
          ImageIcon(
            AssetImage(
              'assets/icons/iconex_broken_home.png',
            ),
          ),
          ImageIcon(
            AssetImage('assets/icons/barcode.png'),
          ),
          ImageIcon(
            AssetImage('assets/icons/book.png'),
          ),
          ImageIcon(
            AssetImage('assets/icons/iconex_broken_user.png'),
          ),
        ],
      ),
      body: vm.screens[vm.currentIndex],
    );
  }
}
