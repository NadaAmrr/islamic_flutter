import 'package:flutter/material.dart';
import 'package:islamic/core/utils/app_image.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.quranLogo),
      ],
    );
  }
}