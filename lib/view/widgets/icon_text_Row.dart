import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/size_config.dart';
import 'package:food_delivery/view/widgets/icon_text_widget.dart';


class IconAndTextRow extends StatelessWidget {
  final String text;
  final String distance;
  final String time;
  double size;

  IconAndTextRow(
      {Key? key,
        required this.text,
        required this.distance,
        required this.time,
        this.size = 0,
        thi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconAndTextWidget(
          icon: Icons.circle_sharp,
          text: text,
          iconColor: AppColors.iconColor1,
          size: size == 0 ? Dimensions.iconSize24 : size,
        ),
        IconAndTextWidget(
          icon: Icons.location_on,
          text: distance,
          iconColor: AppColors.mainColor,
          size: size == 0 ? Dimensions.iconSize24 : size,
        ),
        IconAndTextWidget(
          icon: Icons.access_time_rounded,
          text: time,
          iconColor: AppColors.iconColor2,
          size: size == 0 ? Dimensions.iconSize24 : size,
        ),
      ],
    );
  }
}
