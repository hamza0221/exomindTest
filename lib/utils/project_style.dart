import 'package:exomind_test/utils/app_colors.dart';
import 'package:exomind_test/utils/size_config.dart';
import 'package:flutter/material.dart';

class ProjectStyle {
  static TextStyle textPercent = TextStyle(
      fontSize: getProportionateScreenWidth(18),
      fontWeight: FontWeight.w600,
      color: Colors.black);
  static TextStyle textHome = TextStyle(
      fontSize: getProportionateScreenWidth(14), color: AppColors.greenButton);

  static const styleblackWeath =
      TextStyle(fontSize: 21, color: Colors.black, fontWeight: FontWeight.w300);
  static TextStyle headerTitle = const TextStyle(
      fontSize: 30, color: Colors.white, fontWeight: FontWeight.w900);
  static TextStyle headerCategorieTitle = const TextStyle(
      fontSize: 30, color: Colors.white, fontWeight: FontWeight.w800);
  static TextStyle headerCategorie = const TextStyle(
      fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700);
  static TextStyle homeContentTitle = const TextStyle(
      fontSize: 25, color: Colors.black, fontWeight: FontWeight.w900);
  static TextStyle homeCategorieItemTitle = const TextStyle(
      fontSize: 10, color: Colors.black, fontWeight: FontWeight.w800);
  static TextStyle bookTitle = const TextStyle(
      fontSize: 25, color: Colors.black, fontWeight: FontWeight.w700);
  static TextStyle bookTitleDescrition = const TextStyle(
      fontSize: 11, color: Colors.black, fontWeight: FontWeight.w400);
  static TextStyle bookDescrition = const TextStyle(
      fontSize: 15, color: Color(0xFF1AB350), fontWeight: FontWeight.w800);
  static TextStyle waitText = const TextStyle(
      fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400);
  static TextStyle bookMetaDataTitle = const TextStyle(
      fontSize: 13, color: Color(0xFF1AB350), fontWeight: FontWeight.w600);
  static TextStyle bookMetaData = const TextStyle(
      fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600);
  static TextStyle buttonTitle =
      const TextStyle(fontSize: 10, color: AppColors.primaryColorDark);
  static TextStyle offertype = const TextStyle(
      fontSize: 30, color: Color(0xFF1AB350), fontWeight: FontWeight.w800);
}
