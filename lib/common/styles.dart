import 'package:flutter/material.dart';
import 'package:emodule_fe/common/constants.dart';

abstract class ThemeText {
  // We use base size for mobile first
  // Desktop: 32
  //
  static TextStyle titleP = TextStyle(
    fontSize: 16.0,
    fontFamily: '+JakartaSansDisplay',
    fontWeight: FontWeight.w700,
    color: Constant.DS_PURPLE,
  );

  static TextStyle titleW = TextStyle(
    fontSize: 16.0,
    fontFamily: '+JakartaSansDisplay',
    fontWeight: FontWeight.w700,
    color: Constant.LS_ECRU_WHITE,
  );

  // 16, w500
  static TextStyle subtitleP = TextStyle(
    fontFamily: '+JakartaSansDisplay',
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    color: Constant.DS_PURPLE,
  );

  static TextStyle subtitleW = TextStyle(
    fontFamily: '+JakartaSansDisplay',
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    color: Constant.LS_ECRU_WHITE,
  );

  static const TextStyle heading_1 = TextStyle(
    fontFamily: '+JakartaSansDisplay',
    fontSize: 20.0,
    fontWeight: FontWeight.w700
  );

  static TextStyle heading_1_p = TextStyle(
    fontFamily: '+JakartaSansDisplay',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: Constant.DS_PURPLE,
  );

  static const TextStyle subheading_1 = TextStyle(
    fontFamily: '+JakartaSansDisplay',
    fontSize: 18.0,
    fontWeight: FontWeight.w400
  );

  static const TextStyle heading_2 = TextStyle(
    fontFamily: '+JakartaSansDisplay',
    fontSize: 14.0,
    fontWeight: FontWeight.w700
  );

  static TextStyle heading_2_p = TextStyle(
    fontFamily: '+JakartaSansDisplay',
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    color: Constant.DS_PURPLE,
  );

  static const TextStyle heading_3 = TextStyle(
    fontFamily: '+JakartaSansDisplay',
    fontSize: 12.0,
    fontWeight: FontWeight.w700
  );

  static TextStyle heading_3_p = TextStyle(
    fontFamily: '+JakartaSansDisplay',
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
    color: Constant.DS_PURPLE,
  );

  static TextStyle standardBoldP = TextStyle(
    fontFamily: '+JakartaSansText',
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
    color: Constant.DS_PURPLE,
  );

  static TextStyle standardBoldW = TextStyle(
    fontFamily: '+JakartaSansText',
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
    color: Constant.LS_ECRU_WHITE,
  );

  // w400
  static TextStyle standardNormalP = TextStyle(
    fontFamily: '+JakartaSansText',
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: Constant.DS_PURPLE,
  );

  static TextStyle standardNormalW = TextStyle(
    fontFamily: '+JakartaSansText',
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: Constant.LS_ECRU_WHITE,
  );

  static TextStyle standardNormalB = TextStyle(
    fontFamily: '+JakartaSansText',
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
  );

  static TextStyle standardNormalG = TextStyle(
    fontFamily: '+JakartaSansText',
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: Color(0xFF303030),
  );

  static TextStyle standardMiniP = TextStyle(
    fontFamily: '+JakartaSansText',
    fontSize: 10.0,
    fontWeight: FontWeight.w500,
    color: Constant.DS_PURPLE,
  );

  static TextStyle standardMiniW = TextStyle(
    fontFamily: '+JakartaSansText',
    fontSize: 10.0,
    fontWeight: FontWeight.w500,
    color: Constant.LS_ECRU_WHITE,
  );

  static TextStyle standardFormFieldP = TextStyle(
    fontFamily: '+JakartaSansText',
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: Constant.DS_PURPLE,
  );

  static TextStyle standardFormFieldW = TextStyle(
    fontFamily: '+JakartaSansText',
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: Constant.LS_ECRU_WHITE,
  );

  static TextStyle standardSoonP = TextStyle(
    fontFamily: '+JakartaSansText',
    fontSize: 10.0,
    fontWeight: FontWeight.w500,
    color: Constant.DS_PURPLE,
  );

  static TextStyle standardSoonW = TextStyle(
    fontFamily: '+JakartaSansText',
    fontSize: 10.0,
    fontWeight: FontWeight.w500,
    color: Constant.LS_ECRU_WHITE,
  );
}
