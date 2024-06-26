import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/provider/app_confing_provider.dart';
import 'package:islamic/screens/sheets/lang_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.setting,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Divider(),
          /// Language
          Text(
            AppLocalizations.of(context)!.lang,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  isDismissible: true,
                  isScrollControlled: true,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * .5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Theme.of(context).primaryColor
                      ),
                      child: LanguageBottomSheet(),
                    );
                  });
            },
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Theme.of(context).primaryColor)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child:
                      provider.appLang == "en"
                      ? Text(
                          AppLocalizations.of(context)!.en,
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      : Text(
                          AppLocalizations.of(context)!.ar,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  isDismissible: true,
                  isScrollControlled: true,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * .5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      // child: ThemeBottomSheet(),
                    );
                  });
            },
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Theme.of(context).primaryColor)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: true
                      // provider.theme == ThemeMode.light
                      ? Text(
                          AppLocalizations.of(context)!.light,
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      : Text(
                          AppLocalizations.of(context)!.dark,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                )),
          ),
        ],
      ),
    );
  }
}
