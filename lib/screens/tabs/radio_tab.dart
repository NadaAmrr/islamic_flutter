import 'package:flutter/material.dart';
import 'package:islamic/core/utils/app_assets.dart';
import 'package:islamic/core/utils/app_colors.dart';
import 'package:islamic/provider/app_confing_provider.dart';
import 'package:islamic/screens/tabs/provider/radio_tab_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppConfigProvider>(context);
    final iconColor = provider.isLightMode()
        ? AppColors.iconMainSelected
        : AppColors.iconMainDarkSelected;
    return ChangeNotifierProvider(
      create: (BuildContext context) => RadioTabProvider()..getRadioData(),
      child: Consumer<RadioTabProvider>(
        builder: (BuildContext context, RadioTabProvider radioTabProvider,
            Widget? child) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(AppAssets.radio)),
                ),
                Expanded(
                  child: radioTabProvider.radios.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ))
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const PageScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(radioTabProvider.radios[index].name ?? "",
                                    // AppLocalizations.of(context)!.quranRadio,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                provider.isEng()
                                    ? SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.skip_previous,
                                              size: 50,
                                              color: iconColor,
                                            ),
                                            // IconButton(
                                            //   icon: Icon(Icons.pause, size: 50,color: iconColor,), onPressed: () {
                                            //     radioTabProvider.play(index);
                                            // },
                                            // ),
                                            Icon(
                                              Icons.skip_next,
                                              size: 50,
                                              color: iconColor,
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.skip_next,
                                              size: 50,
                                              color: iconColor,
                                            ),
                                            Icon(
                                              Icons.play_arrow,
                                              size: 50,
                                              color: iconColor,
                                            ),
                                            Icon(
                                              Icons.skip_previous,
                                              size: 50,
                                              color: iconColor,
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            );
                          },
                          itemCount: radioTabProvider.radios.length,
                        ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
