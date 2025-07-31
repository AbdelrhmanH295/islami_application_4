import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_application_4/UI/home/Tabs/quran/quran_resources.dart';
import 'package:islami_application_4/utils/app_assets.dart';
import 'package:islami_application_4/utils/app_colors.dart';
import 'package:islami_application_4/utils/app_styles.dart';

class SuraItem extends StatelessWidget {
  int index ;
  SuraItem({super.key ,required this.index});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.suraNumber),
            Text(
              '${index+1}',
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ],
        ),
        SizedBox(
          width: width * 0.04,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranResources.englishQuranList[index],
              style: AppStyles.bold16white.copyWith(fontSize: 20),
            ),
            Text('${QuranResources.versesNumberList[index]} verses',
                style: AppStyles.bold16white.copyWith(fontSize: 14)),
          ],
        ),
        Spacer(),
        Text(
          QuranResources.arabicQuranList[index],
          style: AppStyles.bold16white.copyWith(fontSize: 20),
        )
      ],
    );
  }
}
