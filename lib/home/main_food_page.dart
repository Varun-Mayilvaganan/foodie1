import 'package:flutter/material.dart';
import 'package:foodie/home/food_page_body.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/widgets/small_text.dart';
import '../widgets/big_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top:20,bottom: 15),
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [

                      BigText(text:"India",
                      color: AppColors.Locate,
                      ),

                      SmallText(text: "Ranipet", color: AppColors.iconColor2)
                    ],
                  ),
                  Container(

                    width: 45,
                    height: 45,
                    child: IconButton(
                      onPressed: (){}, 
                      icon: Icon(Icons.search,
                      color: Colors.white),
                      ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor,

                    ),
                  )
                ],
              ),
            ),
          ),
          FoodPageBody(),
        ],
      )
    );
  }
}
