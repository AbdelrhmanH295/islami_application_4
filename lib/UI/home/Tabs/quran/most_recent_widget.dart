import 'package:flutter/material.dart';
import 'package:islami_application_4/utils/app_assets.dart';
import 'package:islami_application_4/utils/app_colors.dart';
import 'package:islami_application_4/utils/app_styles.dart';

class MostRecentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
          Text(
            'Most recent',
            style: AppStyles.bold16white,
          ),
          SizedBox(
            height: height * 0.15,
            width: double.infinity,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primaryColor),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Al-Anbiya',
                              style: AppStyles.bold24black,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              'الأنبياء',
                              style: AppStyles.bold24black,
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text(
                              '112 Verses',
                              style: AppStyles.bold24black,
                            ),
                          ],
                        ),
                        Image.asset(AppAssets.mostRecentelyImg)
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: width * 0.03,
                  );
                },
                itemCount: 10),
          ),
    ],
  );
  }
}