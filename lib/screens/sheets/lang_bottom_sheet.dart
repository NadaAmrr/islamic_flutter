import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/core/utils/app_colors.dart';
import 'package:islamic/provider/app_confing_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.lang,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20,),
          /// Language: EN
          InkWell(
            onTap: () {
              provider.changeLang("en");
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.en,
                      style: TextStyle(
                          color: provider.appLang == "en"

                              /// EN
                              ? provider.appTheme == ThemeMode.light
                                  ? AppColors.textMain
                                  : AppColors.textDarkMain

                              /// AR
                              : provider.appTheme == ThemeMode.light
                                  ? AppColors.textMain
                                  : AppColors.yellow,
                          fontSize: 30,
                          fontFamily: 'ElMessiri',
                          fontWeight: FontWeight.bold),
                    ),

                    /// Lang == ar ? ❎️: ✔
                    provider.appLang == "en"
                        ? Icon(
                            Icons.done,
                            size: 30,
                            color: provider.appLang == "en"
                            /// EN
                                ? provider.appTheme == ThemeMode.light
                                    ? AppColors.textMain
                                    : AppColors.textDarkMain
                            /// AR
                                : provider.appTheme == ThemeMode.light
                                    ? AppColors.textMain
                                    : AppColors.yellow,
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
          /// Language: AR
          InkWell(
            onTap: () {
              /// AR
              provider.changeLang("ar");
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.ar,
                      style: TextStyle(
                          color: provider.appLang == "ar"

                              /// EN
                              ? provider.appTheme == ThemeMode.light
                                  ? AppColors.textMain
                                  : AppColors.textDarkMain

                              /// AR
                              : provider.appTheme == ThemeMode.light
                                  ? AppColors.textMain
                                  : AppColors.yellow,
                          fontSize: 30,
                          fontFamily: 'ElMessiri',
                          fontWeight: FontWeight.bold),
                    ),

                    /// Lang == en ? ❎️: ✔
                    provider.appLang == "en"
                        ? const SizedBox()
                        : Icon(
                            Icons.done,
                            size: 30,
                            color: provider.appLang == "ar"

                                /// EN
                                ? provider.appTheme == ThemeMode.light
                                    ? AppColors.textMain
                                    : AppColors.textDarkMain

                                /// AR
                                : provider.appTheme == ThemeMode.light
                                    ? AppColors.textMain
                                    : AppColors.yellow,
                          ),
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
