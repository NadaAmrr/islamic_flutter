import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/core/utils/app_image.dart';
import 'package:islamic/models/hadeth_model.dart';
import 'package:islamic/screens/hadethDetails/hadeth_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> hadethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty) {
      loadFile();
    }
    return Column(
      children: [
        Center(child: Image.asset(AppImages.hadethLogo)),
        const Divider(),
        Text(
          AppLocalizations.of(context)!.ahadeth,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Divider(),
        hadethList.isEmpty
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
                                arguments: hadethList[index]);
                          },
                          child: Text(hadethList[index].header, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black), textAlign: TextAlign.center,));
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: hadethList.length),
              )
      ],
    );
  }

  /// functions
  void loadFile() async {
    String ahadeth = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> list = ahadeth.split('#\r\n');
    for (int i = 0; i < list.length; i++) {
      List<String> content = list[i].split('\n');
      String header = content[0];
      content.removeAt(0);
      HadethModel hadethModel = HadethModel(header: header, content: content);
      hadethList.add(hadethModel);
      print(hadethList[i].header);
    }
    setState(() {});
  }
}
