import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/core/utils/app_colors.dart';
import 'package:islamic/core/utils/app_image.dart';
import 'package:islamic/models/sura_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SuraDetailsScreen extends StatefulWidget {
  static const routeName = "suraDetails";
  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> data = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (data.isEmpty) {
      loadFile(args.index);
    }
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.defaultBg),
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
            iconTheme: IconThemeData(color: Colors.black),
          ),

          /// Body
          body: data.isEmpty
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
                    color: AppColors.white,
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${AppLocalizations.of(context)!.sura} ${args.name}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Divider(),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Text(
                              '${data[index]} (${index + 1})',
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(),
                            );
                          },
                          itemCount: data.length,
                        ),
                      ),
                    ],
                  ),
                ),
        ));
  }

  /// functions
  void loadFile(int index) async {
    String file = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = file.split('\n');
    // for (var i = 0; i < lines.length; ++i) {
    //   var o = lines[i];
    //
    // }
    data = lines;

    setState(() {});
  }
}
