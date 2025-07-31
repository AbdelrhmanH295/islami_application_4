import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';

import 'package:islami_application_4/utils/app_colors.dart';

class Hadeth {
  final String title;
  final String content;
  Hadeth({required this.title, required this.content});
}

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> hadethList = [];
  bool isLoading = true;
  String? errorMsg;

  @override
  void initState() {
    super.initState();
    loadHadeths();
  }

  Future<void> loadHadeths() async {
    try {
      print('Loading AssetManifest.json...');
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);
      final hadethFiles =
          manifestMap.keys
              .where(
                (String key) =>
                    key.startsWith('assets/files/Hadeeth/h') &&
                    key.endsWith('.txt'),
              )
              .toList()
            ..sort((a, b) => a.compareTo(b));
      print('Found hadeth files:');
      for (final f in hadethFiles) print(f);

      List<Hadeth> loadedHadeths = [];
      for (final file in hadethFiles) {
        try {
          final content = await rootBundle.loadString(file);
          final lines = content.trim().split('\n');
          if (lines.isNotEmpty) {
            final title = lines[0].trim();
            final hadethContent = lines.skip(1).join('\n').trim();
            loadedHadeths.add(Hadeth(title: title, content: hadethContent));
          }
        } catch (e) {
          print('Error loading file $file: $e');
        }
      }
      setState(() {
        hadethList = loadedHadeths;
        isLoading = false;
        errorMsg = null;
      });
    } catch (e) {
      print('Error loading hadeths: $e');
      setState(() {
        isLoading = false;
        errorMsg = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (errorMsg != null) {
      return Center(child: Text('Error: $errorMsg'));
    }
    if (hadethList.isEmpty) {
      return const Center(child: Text('No Hadeths found'));
    }
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 5),
          const SizedBox(height: 16),
          Expanded(
            child: CarouselSlider.builder(
              itemCount: hadethList.length,
              options: CarouselOptions(
                height: height * 0.92,
                enlargeCenterPage: true,
                viewportFraction: 0.85,
                enableInfiniteScroll: true,
              ),
              itemBuilder: (context, index, realIdx) {
                final hadeth = hadethList[index];
                final controller = ScrollController();
                return Center(
                  child: SizedBox(
                    width: width * 0.85,
                    height: height * 0.86,
                    child: Stack(
                      children: [
                        // Card background with primary color
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          margin: EdgeInsets.zero,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 48,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: IgnorePointer(
                                  child: Image.asset(
                                    'assets/images/hadethbgg.png',
                                    height: 350,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Scrollbar(
                                thumbVisibility: true,
                                controller: controller,
                                child: SingleChildScrollView(
                                  controller: controller,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: 32),
                                      Text(
                                        hadeth.title,
                                        style: const TextStyle(
                                          fontFamily: 'Janna',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: Colors.brown,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        hadeth.content,
                                        style: const TextStyle(
                                          fontFamily: 'Janna',
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                      ),
                                      const SizedBox(height: 32),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Border overlay
                        Positioned.fill(
                          child: IgnorePointer(
                            child: Image.asset(
                              'assets/images/hadethborder.png',
                              width: width * 0.85,
                              height: height * 0.50 * 0.7,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}