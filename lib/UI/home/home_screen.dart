// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:islami_application_4/UI/home/Tabs/Timer/timer_tab.dart';
import 'package:islami_application_4/UI/home/Tabs/hadeth/hadeth_tab.dart';
import 'package:islami_application_4/UI/home/Tabs/quran/quran_tab.dart';
import 'package:islami_application_4/UI/home/Tabs/radio/radio_tab.dart';
import 'package:islami_application_4/UI/home/Tabs/sebha/sebha_tab.dart';
import 'package:islami_application_4/utils/app_assets.dart';
import 'package:islami_application_4/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> backgroundImage = [
    AppAssets.quranBg,
    AppAssets.hadeth,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timerBg,
  ];
  List<Widget>tabs=[
    QuranTab(),HadethTab(),SebhaTab(),RadioTab(),TimerTab()
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImage[selectedIndex],
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              currentIndex: selectedIndex,
              selectedItemColor: AppColors.whiteColor,
              unselectedItemColor: AppColors.blackColor,
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.primaryColor,
              items: [
                BottomNavigationBarItem(
                    label: 'Quran',
                    icon: builtBottomNavigationBar(
                        index: 0, imageName: AppAssets.iconQuran)),
                BottomNavigationBarItem(
                    label: 'hadeth',
                    icon: builtBottomNavigationBar(
                        index: 1, imageName: AppAssets.iconHadeth)),
                BottomNavigationBarItem(
                    label: 'Sebha',
                    icon: builtBottomNavigationBar(
                        index: 2, imageName: AppAssets.iconSebha)),
                BottomNavigationBarItem(
                    label: 'Radio',
                    icon: builtBottomNavigationBar(
                        index: 3, imageName: AppAssets.iconRadio)),
                BottomNavigationBarItem(
                    label: 'Timer',
                    icon: builtBottomNavigationBar(
                        index: 4, imageName: AppAssets.iconTimer)),
              ]),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Image.asset(AppAssets.logo),
            Expanded(child:tabs[selectedIndex])
            ],
          ),
        )
      ],
    );
  }

  Widget builtBottomNavigationBar(
      {required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.blackbgColor),
            child: ImageIcon(
              AssetImage(imageName),
            ),
          )
        : ImageIcon(AssetImage(imageName));
  }
}
