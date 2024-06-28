import 'package:flutter/material.dart';
import 'package:islamic/core/utils/app_assets.dart';
import 'package:islamic/models/sura_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/provider/app_confing_provider.dart';
import 'package:islamic/screens/suraDetails/sura_details_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const routeName = "suraDetails";
  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var providerConfig = Provider.of<AppConfigProvider>(context);

    var args = ModalRoute.of(context)!.settings.arguments as SuraModel;
    // if (provider.data.isEmpty) {
    //   provider.loadFile(args.index);
    // }
    return ChangeNotifierProvider(
      create: (BuildContext context) => SuraDetailsProvider()..loadFile(args.index),
      builder: (context, child) {
        var provider = Provider.of<SuraDetailsProvider>(context);

        return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: providerConfig.isLightMode()
                    ? const AssetImage(AppAssets.imgDefaultBg)
                    : const AssetImage(AppAssets.imgDarkBg),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,

              /// App Bar
              appBar: AppBar(
                title: Text(
                  AppLocalizations.of(context)!.appName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),

              /// Body
              body: provider.data.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ))
                  : Container(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.04),
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.06,
                          horizontal: MediaQuery.of(context).size.width * 0.04),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.sura} ${args.name}',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Divider(),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Text(
                                    '${provider.data[index]} (${index + 1})',
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    style:
                                        Theme.of(context).textTheme.bodySmall);
                              },
                              itemCount: provider.data.length,
                            ),
                          ),
                        ],
                      ),
                    ),
            ));
      },
    );
  }
}
