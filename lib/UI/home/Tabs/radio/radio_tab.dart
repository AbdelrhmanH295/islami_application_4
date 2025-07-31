import 'package:flutter/material.dart';
import 'package:islami_application_4/UI/home/Tabs/radio/radio_container.dart';
import 'package:islami_application_4/utils/app_assets.dart';
import 'package:islami_application_4/utils/app_colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RadioTab extends StatelessWidget {
  List<Map<String, String>> radioListt = [
    {
      'name': 'Radio Ibrahim Al-Akdar',
      'playButton': AppAssets.playButton,
      'soundButton': AppAssets.soundButton,
      'radioBg': AppAssets.mosque
    },
    {
      'name': 'Radio Al-Qaria Yassen',
      'playButton': AppAssets.pauseButton,
      'radioBg': AppAssets.mosque,
      'soundButton': AppAssets.soundButton,
    },
    {
      'name': 'Radio Ahmed Al-trabulsi',
      'playButton': AppAssets.playButton,
      'soundButton': AppAssets.soundButton,
      'radioBg': AppAssets.mosque
    },
    {
      'name': 'Radio Addokali Mohammad Alalim',
      'playButton': AppAssets.playButton,
      'soundButton': AppAssets.soundButton,
      'radioBg': AppAssets.mosque
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: ToggleSwitch(
              minWidth: 100,
              minHeight: 40.0,
              fontSize: 21.0,
              initialLabelIndex: 1,
              activeBgColor: [AppColors.primaryColor],
              activeFgColor: Colors.black,
              inactiveBgColor: Colors.transparent,
              inactiveFgColor: AppColors.whiteColor,
              totalSwitches: 2,
              labels: ['Radio', 'Reciters'],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: radioListt.length,
            itemBuilder: (BuildContext context, int index) {
              final radio = radioListt[index];
              print(radio);
              return Column(
                children: [
                  RadioContainer(
                    name: radio['name']!,
                    playButton: radio['playButton']!,
                    radioBg: radio['radioBg']!,
                    soundButton: radio['soundButton']!,
                  )
                ],
              );
            },
          )),
        ],
      ),
    );
  }
}
/*

Column(
      children: [
        RadioContainer(
          name: 'Radio Ibrahim Al-Akdar',
          playButton: AppAssets.pauseButton,
          radioBg: AppAssets.mosque,
          soundButton: AppAssets.mute,
        )
      ],
    );
*/