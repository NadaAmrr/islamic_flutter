import 'package:flutter/material.dart';
import 'package:islamic/core/utils/app_assets.dart';
import 'package:islamic/core/utils/app_colors.dart';
import 'package:islamic/provider/app_confing_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppConfigProvider>(context);
    final iconColor = provider.isLightMode() ? AppColors.iconMainSelected : AppColors.iconMainDarkSelected;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              alignment: Alignment.center, child: Image.asset(AppAssets.radio)),
          Text(AppLocalizations.of(context)!.quranRadio,
              style: Theme.of(context).textTheme.titleMedium),
          provider.isEng()
              ?  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.skip_previous,
                      size: 50,
                      color: iconColor,
                    ),
                    Icon(
                      Icons.play_arrow,
                      size: 50,
                      color: iconColor,
                    ),
                    Icon(
                      Icons.skip_next,
                      size: 50,
                      color: iconColor,
                    ),
                  ],
                )
              :  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        ],
      ),
    );
  }
}
