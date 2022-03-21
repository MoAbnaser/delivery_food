import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/base/show_custom_snackbar.dart';
import 'package:food_delivery/logic/controllers/auth_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/size_config.dart';
import 'package:food_delivery/view/screens/auth/sign_up_screen.dart';
import 'package:food_delivery/view/widgets/auth_text_form_field.dart';
import 'package:food_delivery/view/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _logIn(AuthController authController) {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    if (email.isEmpty) {
      showCustomSnackBar('type in your Email address', title: 'Email address');
    } else if (!GetUtils.isEmail(email)) {
      showCustomSnackBar('type in a valid email address',
          title: 'Valid Email address');
    } else if (password.isEmpty) {
      showCustomSnackBar('type in your password', title: 'Password');
    } else if (password.length < 6) {
      showCustomSnackBar('password can\'t be less than 6 characters',
          title: 'Password');
    } else {
      showCustomSnackBar('All Went Well', title: 'Perfect');

      authController.logIn(email, password).then((status) {
        if (status.isSuccess) {
          Get.toNamed(AppRoutes.getHomePage());
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
        builder: (_authController) {
          return !_authController.isLoading
              ? Column(
                  children: [
                    SizedBox(height: Dimensions.screenHeight * 0.05),
                    //AppLogo
                    Container(
                      height: Dimensions.screenHeight * 0.25,
                      child: const Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 80,
                          backgroundImage:
                              AssetImage('assets/image/logo part 1.png'),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                    //welcome
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.width20),
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hello',
                            style: TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Welcome to our Delivery Food',
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                    Form(
                      key: _formKey,
                      child: Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              AuthTextFormField(
                                hintText: 'Email',
                                inputType: TextInputType.emailAddress,
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: AppColors.yellowColor,
                                  size: 30,
                                ),
                                obscureText: false,
                                validator: (value) {
                                  // if (!RegExp(Constants.validationEmail)
                                  //     .hasMatch(value)) {
                                  //   return 'Invalid Email';
                                  // } else {
                                  //   return null;
                                  // }
                                },
                                controller: _emailController,
                              ),
                              SizedBox(
                                height: Dimensions.height20,
                              ),
                              AuthTextFormField(
                                hintText: 'Password',
                                inputType: TextInputType.visiblePassword,
                                prefixIcon: const Icon(
                                  Icons.password_sharp,
                                  color: AppColors.yellowColor,
                                  size: 30,
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value.toString().length < 6) {
                                    return 'Password should be longer or equal 6 characters';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _passwordController,
                              ),
                              const SizedBox(height: 100),
                              GestureDetector(
                                onTap: () {
                                  _logIn(_authController);
                                  Get.toNamed(AppRoutes.homePage);
                                },
                                child: Container(
                                  width: Dimensions.screenWidth / 2,
                                  height: Dimensions.screenHeight / 13,
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: BigText(
                                      text: 'Sign in',
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              RichText(
                                text: TextSpan(
                                    text: 'Don\'t have an account ?',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () =>
                                              Get.to(() => SignUpScreen()),
                                        text: 'Sign Up',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : const CustomLoader();
        },
      ),
    );
  }
}
