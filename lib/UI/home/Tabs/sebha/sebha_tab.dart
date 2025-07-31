import 'package:flutter/material.dart';
import 'package:islami_application_4/utils/app_assets.dart';
import 'package:islami_application_4/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> with SingleTickerProviderStateMixin {
  List<String> azkar = ['الله اكبر', 'اسغفرالله', 'الحمدلله'];
  int counter = 0;
  int maxCount = 33;
  int currentZikerIndex = 0;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void incrementCounter() {
    setState(() {
      counter++;
      if (counter == 32) {
        _controller.forward(from: 0);
      }
      if (counter >= maxCount) {
        counter = 0;
        currentZikerIndex++;
      }
      if (currentZikerIndex >= azkar.length) {
        currentZikerIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
              style: AppStyles.bold36white,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: Image.asset(AppAssets.sebha),
              ),
              Column(
                children: [
                  Text(
                    azkar[currentZikerIndex],
                    style: AppStyles.bold36white,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  InkWell(
                    onTap: incrementCounter,
                    child: Text(
                      '${counter}',
                      style: AppStyles.bold36white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
