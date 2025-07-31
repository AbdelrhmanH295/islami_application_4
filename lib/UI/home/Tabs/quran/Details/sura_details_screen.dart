import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application_4/UI/home/Tabs/quran/Details/sura_content_item.dart';
import 'package:islami_application_4/UI/home/Tabs/quran/quran_resources.dart';
import 'package:islami_application_4/utils/app_assets.dart';
import 'package:islami_application_4/utils/app_colors.dart';
import 'package:islami_application_4/utils/app_styles.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura-details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranList[index],
          style: AppStyles.bold20primary,
        ),
      ),
      body: Column(children: [
        Row(
          children: [
            Image.asset(AppAssets.cornerLeft),
            Spacer(),
            Image.asset(AppAssets.cornerRight)
          ],
        ),

        Text(
          QuranResources.arabicQuranList[index],
          style: AppStyles.bold24primary,
        ),
        SizedBox(
          height: 6,
        ),
        Expanded(
          child: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      
                      padding: const EdgeInsets.all(8.0),
                      child: SuraContentItem(
                        suraContent: verses[index],
                        index: index,
                      ),
                    );
                  },
                  itemCount: verses.length,
                ),
        ),

        // Spacer(),
        Image.asset(AppAssets.mask)
      ]),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/Suras/${index + 1}.txt');
    List<String> lines = fileContent.split('\n');

    verses = lines;
    Future.delayed(
      Duration(seconds: 1),
      () => setState(() {}),
    );
  }
}
