import 'package:flutter/material.dart';
import 'package:islamic/core/theme/app_theme.dart';
import 'package:islamic/screens/home/home_screen.dart';
import 'package:islamic/screens/suraDetails/sura_details_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
      },
    );
  }
}