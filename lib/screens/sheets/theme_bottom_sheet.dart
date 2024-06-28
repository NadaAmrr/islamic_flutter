import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/core/utils/app_colors.dart';
import 'package:islamic/provider/app_confing_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          /// Theme TEXT
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.titleMedium,
          ),

          /// LIGHT
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.light,
                      style: TextStyle(
                          color: provider.appTheme == ThemeMode.light
                              ? AppColors.textMain
                              : AppColors.yellow,
                          fontSize: 30,
                          fontFamily: 'ElMessiri',
                          fontWeight: FontWeight.bold),
                    ),
                    provider.isLightMode()
                        ? const Icon(
                            Icons.done,
                            size: 30,
                            color: AppColors.textMain,
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),

          /// Dark
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.dark,
                      style: TextStyle(
                          color: provider.appTheme == ThemeMode.light
                              ? AppColors.main
                              : AppColors.textDarkMain,
                          fontSize: 30,
                          fontFamily: 'ElMessiri',
                          fontWeight: FontWeight.bold),
                    ),
                    provider.isDarkMode()
                        ? const Icon(
                            Icons.done,
                            size: 30,
                            color: AppColors.textDarkMain,
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
