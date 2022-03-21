import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/base/show_custom_snackbar.dart';
import 'package:food_delivery/logic/controllers/auth_controller.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/size_config.dart';
import 'package:food_delivery/view/screens/auth/sign_in_screen.dart';
import 'package:food_delivery/view/widgets/auth_text_form_field.dart';
import 'package:food_delivery/view/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  var signUpImages = [
    't.png',
    'f.png',
    'g.png',
  ];

  void _registration(AuthController authController) {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String phone = _phoneController.text.trim();
    String password = _passwordController.text.trim();
    if (name.isEmpty) {
      showCustomSnackBar('type in your Name', title: 'Name');
    } else if (phone.isEmpty) {
      showCustomSnackBar('type in your phone number', title: 'Phone number');
    } else if (email.isEmpty) {
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
      SignUpBody signUpBody = SignUpBody(
        name: name,
        phone: phone,
        email: email,
        password: password,
      );
      authController.registration(signUpBody).then((status) {
        if (status.isSuccess) {
          print('success');
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
                    SizedBox(
                      height: Dimensions.screenHeight * 0.05,
                    ),
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
                    Form(
                      key: _formKey,
                      child: Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              AuthTextFormField(
                                hintText: 'User Name',
                                inputType: TextInputType.name,
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: AppColors.yellowColor,
                                  size: 30,
                                ),
                                obscureText: false,
                                validator: (value) {},
                                controller: _nameController,
                              ),
                              SizedBox(
                                height: Dimensions.height20,
                              ),
                              AuthTextFormField(
                                hintText: 'Email',
                                inputType: TextInputType.emailAddress,
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: AppColors.yellowColor,
                                  size: 30,
                                ),
                                obscureText: false,
                                validator: (value) {},
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
                              SizedBox(
                                height: Dimensions.height20,
                              ),
                              AuthTextFormField(
                                hintText: 'phone',
                                inputType: TextInputType.phone,
                                prefixIcon: const Icon(
                                  Icons.phone,
                                  color: AppColors.yellowColor,
                                  size: 30,
                                ),
                                obscureText: false,
                                validator: (value) {
                                  // if (value.toString().length < 6) {
                                  //   return 'Password should be longer or equal 6 characters';
                                  // } else {
                                  //   return null;
                                  // }
                                },
                                controller: _phoneController,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _registration(_authController);
                                  Get.toNamed(AppRoutes.signInScreen);
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
                                      text: 'Sign Up',
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              RichText(
                                text: TextSpan(
                                    text: 'Have an account already? ',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () =>
                                              Get.to(() => SignInScreen()),
                                        text: 'Sign In',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ]),
                              ),
                              const SizedBox(height: 10),
                              RichText(
                                text: const TextSpan(
                                  text: 'Or',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Wrap(
                                children: List.generate(
                                  3,
                                  (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: Dimensions.radius30,
                                      backgroundImage: AssetImage(
                                          'assets/image/' +
                                              signUpImages[index]),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : const CustomLoader();
        },
      ),
    );
  }
}
