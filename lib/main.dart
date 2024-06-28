import 'package:flutter/material.dart';
import 'package:islamic/app/my_app.dart';
import 'package:islamic/provider/app_confing_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppConfigProvider()),
        // ChangeNotifierProvider(create: (context) => AssetsProvider(AppConfigProvider())),
      ],
      child: MyApp()));
}
