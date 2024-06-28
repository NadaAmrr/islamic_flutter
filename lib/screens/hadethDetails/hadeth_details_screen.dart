import 'package:flutter/material.dart';
import 'package:islamic/core/utils/app_assets.dart';
import 'package:islamic/models/hadeth_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/provider/app_confing_provider.dart';
import 'package:provider/provider.dart';

class HadthDetailsScreen extends StatefulWidget {
  static const routeName = "hadeth";
  const HadthDetailsScreen({super.key});

  @override
  State<HadthDetailsScreen> createState() => _HadthDetailsScreenState();
}

class _HadthDetailsScreenState extends State<HadthDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    var args = ModalRoute.of(context)!.settings.arguments as HadethModel;

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: provider.isLightMode() ? const AssetImage(AppAssets.imgDefaultBg) : const AssetImage(AppAssets.imgDarkBg),
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
          body: args.content.isEmpty
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
                        args.header,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const Divider(),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Text(
                              args.content[index],
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                            );
                          },
                          itemCount: args.content.length,
                        ),
                      ),
                    ],
                  ),
                ),
        ));
  }
}
