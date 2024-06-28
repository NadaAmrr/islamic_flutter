import 'package:flutter/material.dart';
import 'package:islamic/core/utils/app_colors.dart';
import 'package:islamic/core/utils/app_assets.dart';
import 'package:islamic/provider/app_confing_provider.dart';
import 'package:islamic/screens/home/home_screen_povider.dart';
import 'package:islamic/screens/tabs/hadeth_tab.dart';
import 'package:islamic/screens/tabs/quran_tab.dart';
import 'package:islamic/screens/tabs/radio_tab.dart';
import 'package:islamic/screens/tabs/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/screens/tabs/settings_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "home";

   HomeScreen({super.key});

  // int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var providerConfig = Provider.of<AppConfigProvider>(context);

    return ChangeNotifierProvider(
        create: (BuildContext context) => HomeScreenPovider(),
        builder: (context, child) {
          var provider = Provider.of<HomeScreenPovider>(context);
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: providerConfig.isLightMode()
                    ? AssetImage(AppAssets.imgDefaultBg)
                    : AssetImage(AppAssets.imgDarkBg),
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
              bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: provider.selectedIndex,
                  onTap: provider.getIndexTab,
                  items: [
                    BottomNavigationBarItem(
                        icon: const ImageIcon(AssetImage(AppAssets.iconRadio)),
                        label: AppLocalizations.of(context)!.radio),
                    BottomNavigationBarItem(
                        icon: const ImageIcon(AssetImage(AppAssets.iconSebha)),
                        label: AppLocalizations.of(context)!.tasbeh),
                    BottomNavigationBarItem(
                        icon: const ImageIcon(AssetImage(AppAssets.iconHadeth)),
                        label: AppLocalizations.of(context)!.ahadeth),
                    BottomNavigationBarItem(
                        icon: const ImageIcon(AssetImage(AppAssets.iconQuran)),
                        label: AppLocalizations.of(context)!.quran),
                    BottomNavigationBarItem(
                        icon: const Icon(Icons.settings),
                        label: AppLocalizations.of(context)!.setting),
                  ]),
              body: tabs[provider.selectedIndex],
            ),
          );
        });
  }

  List<Widget> tabs = [
    const RadioTab(),
    const SebhaTab(),
    const HadethTab(),
    QuranTab(),
    const SettingsTab()
  ];
}
