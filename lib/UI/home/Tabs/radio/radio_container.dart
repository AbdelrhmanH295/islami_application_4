import 'package:flutter/material.dart';
import 'package:islami_application_4/utils/app_assets.dart';
import 'package:islami_application_4/utils/app_colors.dart';
import 'package:islami_application_4/utils/app_styles.dart';

class RadioContainer extends StatelessWidget {
  RadioContainer(
      {required this.name,
      required this.playButton,
      required this.radioBg,
      required this.soundButton});
  String name;
  String radioBg;
  String playButton;
  String soundButton;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(
            vertical: height * 0.01, horizontal: width * 0.04),
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryColor,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(radioBg),
            Column(
              children: [
                Text(
                  name,
                  style: AppStyles.bold20black,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage(playButton),
                      size: 32,
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    ImageIcon(
                      AssetImage(soundButton),
                      size: 32,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
