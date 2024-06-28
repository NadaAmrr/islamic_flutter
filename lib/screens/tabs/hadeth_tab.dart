import 'package:flutter/material.dart';
import 'package:islamic/core/utils/app_assets.dart';
import 'package:islamic/screens/hadethDetails/hadeth_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/screens/tabs/provider/hadeth_tab_provider.dart';
import 'package:provider/provider.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    // if (hadethList.isEmpty) {
    //   loadFile();
    // }
    return ChangeNotifierProvider(
      create: (BuildContext context) => HadethTabProvider()..loadFile(),
      builder: (context, child) {
        var provider = Provider.of<HadethTabProvider>(context);

        return Column(
          children: [
            Center(child: Image.asset(AppAssets.hadethLogo)),
            const Divider(),
            Text(
              AppLocalizations.of(context)!.ahadeth,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            provider.hadethList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ))
                : Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    HadthDetailsScreen.routeName,
                                    arguments: provider.hadethList[index]);
                              },
                              child: Text(
                                provider.hadethList[index].header,
                                style: Theme.of(context).textTheme.titleSmall,
                                textAlign: TextAlign.center,
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: provider.hadethList.length),
                  )
          ],
        );
      },
    );
  }
}
