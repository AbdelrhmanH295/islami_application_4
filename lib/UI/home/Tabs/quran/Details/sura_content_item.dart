import 'package:flutter/material.dart';
import 'package:islami_application_4/utils/app_colors.dart';
import 'package:islami_application_4/utils/app_styles.dart';

class SuraContentItem extends StatelessWidget {
  int index;
  String suraContent;
  SuraContentItem({required this.suraContent, required this.index});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(vertical: height*0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.primaryColor, width: 2)),
      child: Text('[${index + 1}]$suraContent,',
          style: AppStyles.bold20primary, textAlign: TextAlign.center),
    );
  }
}
