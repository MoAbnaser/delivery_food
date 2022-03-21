import 'package:flutter/material.dart';
import 'package:food_delivery/utils/size_config.dart';
import 'package:food_delivery/view/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  double size;

  IconAndTextWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: size == 0 ? Dimensions.iconSize24 : size,
        ),
        SizedBox(width: Dimensions.width10 / 2),
        SmallText(
          text: text,
        ),
      ],
    );
  }
}
