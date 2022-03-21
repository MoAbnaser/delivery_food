import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //dynamic height padding & margin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.2;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.1;

  //dynamic Width padding & margin
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.2;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.1;

  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.1;

  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;

  static double splashImg = screenHeight /3.38;
}
