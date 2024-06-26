import 'package:flutter/material.dart';
import 'package:islamic/core/utils/app_colors.dart';
import 'package:islamic/core/utils/app_image.dart';
import 'package:islamic/screens/tabs/hadeth_tab.dart';
import 'package:islamic/screens/tabs/quran_tab.dart';
import 'package:islamic/screens/tabs/radio_tab.dart';
import 'package:islamic/screens/tabs/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/screens/tabs/settings_tab.dart';
class HomeScreen extends StatefulWidget {
  static String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData currentTheme = Theme.of(context);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.defaultBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        /// App Bar
        appBar: AppBar(
          elevation: 0,
          title: Text(
            AppLocalizations.of(context)!.appName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),

        /// Bottom Nav bar
        bottomNavigationBar: Theme(
          data: currentTheme.copyWith(
            canvasColor: currentTheme.brightness == Brightness.dark
                ? AppColors.mainDark
                : AppColors.main,
          ),
          child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AppImages.iconRadio)),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AppImages.iconSebha)),
                    label: AppLocalizations.of(context)!.tasbeh),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AppImages.iconHadeth)),
                    label: AppLocalizations.of(context)!.ahadeth),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AppImages.iconQuran)),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.setting),
              ]),
        ),
        body: tabs[selectedIndex],
      ),
    );
  }
  List<Widget> tabs = [
    RadioTab(),
    SebhaTab(),
    HadethTab(),
    QuranTab(),
    SettingsTab()
  ];
}
