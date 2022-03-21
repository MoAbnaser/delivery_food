import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/size_config.dart';
import 'package:food_delivery/view/widgets/account_widget.dart';
import 'package:food_delivery/view/widgets/app_icon.dart';
import 'package:food_delivery/view/widgets/big_text.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: BigText(
          text: 'profile',
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            //profile icon
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height15 * 5,
              size: Dimensions.height15 * 10,
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child:  Column(
                  children: [
                    //name
                    AccountWidget(
                      bigText: BigText(
                        text: 'Mohamed AbdElnaser',
                      ),
                      appIcon: const AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 20),
                    //phone
                    AccountWidget(
                      bigText: BigText(
                        text: '01019070755',
                      ),
                      appIcon: const AppIcon(
                        icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 20),
                    //email
                    AccountWidget(
                      bigText: BigText(
                        text: 'MohamedAbdElnaser@gmail.com',
                        size: Dimensions.font16,
                      ),
                      appIcon: const AppIcon(
                        icon: Icons.email,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 20),
                    //address
                    AccountWidget(
                      bigText: BigText(
                        text: 'Fill in your Address',
                      ),
                      appIcon: const AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 20),
                    //message
                    AccountWidget(
                      bigText: BigText(
                        text: 'message',
                      ),
                      appIcon: const AppIcon(
                        icon: Icons.message,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 20),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
