import 'package:food_delivery/view/screens/auth/sign_in_screen.dart';
import 'package:food_delivery/view/screens/auth/sign_up_screen.dart';
import 'package:food_delivery/view/screens/cart/cart_page.dart';
import 'package:food_delivery/view/screens/food/popular_food_detail.dart';
import 'package:food_delivery/view/screens/food/recommended_food_detail.dart';
import 'package:food_delivery/view/screens/home/home_page.dart';
import 'package:food_delivery/view/screens/home/main_food_page.dart';
import 'package:food_delivery/view/screens/splash/splash_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  //initialRoutes
  static const homePage = '/home-Page';
  static const splashScreen = '/splash-Screen';
  static const mainFoodPage = '/main-Food-Page';
  static const cartPage = '/cart-Page';
  static const popularFoodDetail = '/popular-Food-Detail';
  static const recommendedFoodDetail = '/recommended-Food-Detail';
  static const signUpScreen = '/sign-Up-Screen';
  static const signInScreen = '/sign-In-Screen';


  static String getMainFoodPage() => mainFoodPage;
  static String getSignUpScreen() => signUpScreen;
  static String getSignInScreen() => signInScreen;
  static String getSplashScreen() => splashScreen;
  static String getHomePage() => homePage;
  static String getCartPage() => cartPage;
  static String getPopularFoodDetail(int pageId) =>
      '$popularFoodDetail?pageId=$pageId';
  static String getRecommendedFoodDetail(int pageId) =>
      '$recommendedFoodDetail?pageId=$pageId';


  //getPages
  static List<GetPage> routes = [
    GetPage(
      name: mainFoodPage,
      page: () => const MainFoodPage(),
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
    ),

    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: homePage,
      page: () {
        return const HomePage();
      },
    ),
    GetPage(
      name: popularFoodDetail,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.zoom,
    ),
    GetPage(
      name: recommendedFoodDetail,
      page: () {
        var pageId = Get.parameters['pageId'];
        return RecommendedFoodDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.downToUp,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return const CartPage();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
