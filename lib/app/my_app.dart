import 'package:flutter/material.dart';
import 'package:islamic/core/theme/app_theme.dart';
import 'package:islamic/provider/app_confing_provider.dart';
import 'package:islamic/screens/hadethDetails/hadeth_details_screen.dart';
import 'package:islamic/screens/home/home_screen.dart';
import 'package:islamic/screens/suraDetails/sura_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: provider.appTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: HomeScreen.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLang),
      routes: {
        HomeScreen.routeName: (context) =>  HomeScreen(),
        SuraDetailsScreen.routeName: (context) => const SuraDetailsScreen(),
        HadthDetailsScreen.routeName: (context) => const HadthDetailsScreen(),
      },
    );
  }
}