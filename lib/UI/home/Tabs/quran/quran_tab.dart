// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:islami_application_4/UI/home/Tabs/quran/Details/sura_details_screen.dart';
import 'package:islami_application_4/UI/home/Tabs/quran/most_recent_widget.dart';
import 'package:islami_application_4/UI/home/Tabs/quran/quran_resources.dart';
import 'package:islami_application_4/UI/home/Tabs/quran/sura_item.dart';
import 'package:islami_application_4/utils/app_assets.dart';
import 'package:islami_application_4/utils/app_colors.dart';
import 'package:islami_application_4/utils/app_styles.dart';
import 'package:islami_application_4/utils/app_theme.dart';

/*
width = 430
height = 862
*/
class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(
    114,
    (index) => index,
  );

  //TODO : fill the List with 114 & start from 0
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (newText) {
              searchByNewText(newText);
            },
            style: AppStyles.bold20white,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(color: AppColors.primaryColor, width: 2)),
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.quranSura),
                color: AppColors.primaryColor,
              ),
              hintText: 'Sura name',
              hintStyle: AppStyles.bold16white,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(color: AppColors.primaryColor, width: 2)),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          MostRecentWidget(),
          SizedBox(
            height: height * 0.017,
          ),
          Text(
            'Suras list',
            style: AppStyles.bold16white,
          ),
          Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              SuraDetailsScreen.routeName,
                              arguments: filterList[index]);
                        },
                        child: SuraItem(
                          index: filterList[index],
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      indent: width * 0.05,
                      endIndent: width * 0.05,
                      thickness: 2,
                      color: AppColors.whiteColor,
                    );
                  },
                  itemCount: filterList.length)),
                  
        ],
      ),
    );
  }

  void searchByNewText(String newText) {
    List<int> filterSearchList = [];
    for (int i = 0; i < QuranResources.englishQuranList.length; i++) {
      if (QuranResources.englishQuranList[i].toLowerCase().contains(newText.toLowerCase())) {
        filterSearchList.add(i);
      }
      if (QuranResources.arabicQuranList[i].contains(newText)) {
        filterSearchList.add(i);
      }
    }
    filterList = filterSearchList;
    setState(() {});
  }
}
