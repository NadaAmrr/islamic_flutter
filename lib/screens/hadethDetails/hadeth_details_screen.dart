import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/core/utils/app_colors.dart';
import 'package:islamic/core/utils/app_image.dart';
import 'package:islamic/models/hadeth_model.dart';
import 'package:islamic/models/sura_model.dart';

class HadthDetailsScreen extends StatefulWidget {
  static const routeName = "hadeth";
  HadthDetailsScreen({super.key});

  @override
  State<HadthDetailsScreen> createState() => _HadthDetailsScreenState();
}

class _HadthDetailsScreenState extends State<HadthDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HadethModel;

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
              'Islami',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            iconTheme: IconThemeData(color: Colors.black),
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
                    color: AppColors.white,
                  ),
                  child: Column(
                    children: [
                      Text(
                        args.header,
                        style: Theme.of(context).textTheme.titleLarge,
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
                                  .titleLarge!
                                  .copyWith(),
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
