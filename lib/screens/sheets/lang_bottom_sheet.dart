
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/provider/app_confing_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});
  // bool isEnglish = true;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.lang, style: Theme.of(context).textTheme.titleMedium,),
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
                          // color: provider.appLang == "en"
                          //     ? provider.theme == ThemeMode.light //en
                          //     ? MyThemeData.textLight
                          //     : MyThemeData.textDark
                          //     : provider.theme == ThemeMode.light //ar
                          //     ? MyThemeData.primaryColor
                          //     : MyThemeData.yellowColor,
                          fontSize: 30,
                          fontFamily: 'ElMessiri',
                          fontWeight: FontWeight.bold),
                    ),
                    provider.appLang == "en"
                        ? Icon(
                      Icons.done,
                      size: 30,
                      // color: provider.langCode == "en"
                          // ? provider.theme == ThemeMode.light //en
                          // ? MyThemeData.textLight
                          // : MyThemeData.textDark
                          // : provider.theme == ThemeMode.light //ar
                          // ? MyThemeData.primaryColor
                          // : MyThemeData.yellowColor,
                    )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
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
                          // color: provider.langCode == "ar"
                          //     ? provider.theme == ThemeMode.light //en
                          //     ? MyThemeData.textLight
                          //     : MyThemeData.textDark
                          //     : provider.theme == ThemeMode.light //ar
                          //     ? MyThemeData.primaryColor
                          //     : MyThemeData.yellowColor,
                          fontSize: 30,
                          fontFamily: 'ElMessiri',
                          fontWeight: FontWeight.bold),
                    ),
                    provider.appLang == "en"
                        ? SizedBox()
                        : Icon(
                      Icons.done,
                      size: 30,
                      // color: provider.langCode == "ar"
                      //     ? provider.theme == ThemeMode.light //en
                      //     ? MyThemeData.textLight
                      //     : MyThemeData.textDark
                      //     : provider.theme == ThemeMode.light //ar
                      //     ? MyThemeData.primaryColor
                      //     : MyThemeData.textLight,
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