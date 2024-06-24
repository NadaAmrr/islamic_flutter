import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/core/utils/app_image.dart';
import 'package:islamic/models/sura_model.dart';

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
    loadFile(args.index);
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
              args.name,
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
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(
                      data[index],
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                    );
                  },
                  itemCount: data.length,
                ),
        ));
  }

  /// functions
  void loadFile(int index) async {
    String file = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = file.split('\n');
    data = lines;
    setState(() {});
  }
}
