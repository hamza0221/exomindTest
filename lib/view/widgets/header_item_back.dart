import 'dart:ui';
import 'package:exomind_test/utils/project_style.dart';
import 'package:exomind_test/utils/size_config.dart';
import 'package:flutter/material.dart';

class HeaderItemBack extends StatelessWidget {
  final String imagePath;
  final String text;
  final Function backFun;

  HeaderItemBack(
      {required this.imagePath, required this.text, required this.backFun});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init;
    return Stack(
      children: <Widget>[
        Image.asset(
          imagePath,
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight! / getProportionateScreenHeight(7),
          fit: BoxFit.cover,
        ),
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight! / getProportionateScreenHeight(7),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(40)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  backFun();
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(20)),
                  child: Icon(
                    Icons.arrow_back,
                    size: getProportionateScreenWidth(30),
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                  padding:
                      EdgeInsets.only(right: getProportionateScreenWidth(30)),
                  child: Text(
                    text,
                    style: ProjectStyle.headerCategorie,
                    textAlign: TextAlign.right,
                  )),
            ],
          ),
        )
      ],
    );
  }
}
