import 'package:flutter/material.dart';
import 'package:food_delivery/utils/size_config.dart';
import 'package:food_delivery/view/widgets/app_icon.dart';
import 'package:food_delivery/view/widgets/big_text.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;

  AccountWidget({Key? key, required this.bigText, required this.appIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(0, 2),
          color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      padding: EdgeInsets.only(
          left: Dimensions.width20,
          top: Dimensions.height10,
          bottom: Dimensions.height10),
      child: Row(
        children: [
          appIcon,
          const SizedBox(width: 20),
          bigText,
        ],
      ),
    );
  }
}
