import 'package:flutter/material.dart';
import 'package:islamic/core/utils/app_assets.dart';
import 'package:islamic/models/sura_model.dart';
import 'package:islamic/screens/suraDetails/sura_details_screen.dart';
import 'package:islamic/screens/tabs/widgets/sura_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class QuranTab extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  List<String> suraNames = [
    "الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"
  ];
  List<int> versesNumber = [7,286,200,176,120,165,206,75,129,109,123,111,43,52,99,128,111,110,98,135,112,78,118,64,77,227,93,88,
    69,60,34,30,73,54,45,83,182,88,75,85,54,53,89,59,37,35,38,29,18,45,60,49,62,55,78,96,29,22,24,13,14,11,11,18,12,12,30,52,52,
    44,28,28,20,56,40,31,50,40,46,42,29,19,36,25,22,17,19,26,30,20,15,21,11,8,5,19,5,8,8,11,11,8,3,9,5,4,6,3,6,3,5,4,5,6
  ];
  QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset(AppAssets.quranLogo)),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.suraName,style: Theme.of(context).textTheme.titleMedium,),
            Text(AppLocalizations.of(context)!.numAyat,style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const Divider(),
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: List.generate(suraNames.length, (index) {
                        return SuraWidget(index: index, name: suraNames[index],);
                      }),
                    ),
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: Column(
                      children: List.generate(versesNumber.length, (index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,  arguments: SuraModel(name: suraNames[index], index: index));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(
                              versesNumber[index].toString(),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}


