import 'package:flutter/material.dart';
import 'package:food_delivery/logic/controllers/popular_product_controller.dart';
import 'package:food_delivery/logic/controllers/recommended_product_controller.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:food_delivery/utils/size_config.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:food_delivery/view/widgets/app_column.dart';
import 'package:food_delivery/view/widgets/big_text.dart';
import 'package:food_delivery/view/widgets/icon_text_Row.dart';
import 'package:food_delivery/view/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.screenHeight / 3.54;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: sized_box_for_whitespace
        //Slider Section
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  height: Dimensions.screenHeight / 2.63,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.isEmpty
                          ? 1
                          : popularProducts.popularProductList.length,
                      itemBuilder: (context, index) {
                        return _buildPageItem(
                            index, popularProducts.popularProductList[index]);
                      }),
                )
              : const CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }), // Dots
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? DotsIndicator(
                  dotsCount: popularProducts.popularProductList.isEmpty
                      ? 1
                      : popularProducts.popularProductList.length,
                  position: _currPageValue,
                  decorator: DotsDecorator(
                    activeColor: AppColors.mainColor,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                )
              : const CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }), // Dots

        SizedBox(
          height: Dimensions.height30,
        ),
        //Recommended Text
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: 'Recommended',
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              BigText(
                text: '.',
                color: Colors.black26,
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              SmallText(text: 'Food Pairing'),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height30,
        ),
        //List of food and images

        GetBuilder<RecommendedProductController>(
            builder: (recommendedProducts) {
          return recommendedProducts.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recommendedProducts.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          bottom: Dimensions.height10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                  AppRoutes.getRecommendedFoodDetail(index));
                            },
                            child: Container(
                              width: Dimensions.screenWidth / 3.25,
                              height: Dimensions.screenHeight / 7.03,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white38,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(Constants.baseUrl +
                                      Constants.upload +
                                      recommendedProducts
                                          .recommendedProductList[index].img!),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: Dimensions.screenHeight / 8.44,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(Dimensions.radius20),
                                  bottomRight:
                                      Radius.circular(Dimensions.radius20),
                                ),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: Dimensions.width20,
                                    right: Dimensions.width10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            AppRoutes.getRecommendedFoodDetail(
                                                index));
                                      },
                                      child: BigText(
                                          text: recommendedProducts
                                              .recommendedProductList[index]
                                              .name!),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    Text(
                                      recommendedProducts
                                          .recommendedProductList[index]
                                          .description!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Roboto',
                                        color: Color(0xFFccc7c5),
                                        fontSize: 12,
                                        height: 1.2,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    IconAndTextRow(
                                      text: 'Normal',
                                      distance: '1.7 Km',
                                      time: '32 min',
                                      size: Dimensions.iconSize16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : const CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }), // Dots
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.getPopularFoodDetail(index));
            },
            child: Container(
              height: _height,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xFF69c5df),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(Constants.baseUrl +
                      Constants.upload +
                      popularProduct.img!),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.screenHeight / 6.52,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: AppColumn(
                  text: popularProduct.name!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
