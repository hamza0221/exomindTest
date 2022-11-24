import 'dart:ui';

import 'package:exomind_test/utils/infos_messages.dart';
import 'package:exomind_test/utils/project_assets.dart';
import 'package:exomind_test/utils/project_style.dart';
import 'package:exomind_test/utils/size_config.dart';
import 'package:flutter/material.dart';

class HeaderItem extends StatelessWidget {
  final String imagePath;
  final String text;

  HeaderItem({
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init;
    return Stack(children: <Widget>[
      Image.asset(
        ProjectAssets.imgHomeWeather,
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight! / getProportionateScreenHeight(5),
        fit: BoxFit.cover,
      ),
      Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight! / getProportionateScreenHeight(5),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      Padding(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(30)),
          child: Center(
              child: Text(
            weatherStatText,
            style: ProjectStyle.headerCategorieTitle,
            textAlign: TextAlign.center,
          )))
    ]);
  }
}
