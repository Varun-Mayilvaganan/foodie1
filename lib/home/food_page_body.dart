import 'package:flutter/material.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/widgets/big_text.dart';
import 'package:foodie/widgets/icons_and_text.dart';
import 'package:foodie/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position) {
          return _buildPageItem(position);
        },
      ),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xFF9294cc),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/food1.png"),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Cheesy Chicken Burger"),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: AppColors.mainColor,
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SmallText(text: '4.5'),
                      SizedBox(width: 10),
                      SmallText(text: '1287'),
                      SizedBox(width: 2),
                      SmallText(text: 'comments'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      IconAndTextWidget(
                        icon: Icons.circle_notifications,
                        text: 'Normal',
                        iconColor: AppColors.iconColor2,
                      ),
                      IconAndTextWidget(
                        icon: Icons.location_on,
                        text: '1.7km',
                        iconColor: AppColors.mainColor,
                      ),
                      IconAndTextWidget(
                        icon: Icons.timer,
                        text: '32min',
                        iconColor: AppColors.iconColor2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
