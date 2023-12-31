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
  var _currPageValue=0.0;
  double _scaleFactor=0.9;
  double _height =220;

  @override 
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!; 

      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }


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
    Matrix4 matrix = new Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currtrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currtrans, 0);
    }
    else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index)*(1-_scaleFactor);
      var currtrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currtrans, 0);;
    }
    else if(index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currtrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currtrans, 0);;
    }
    else{
      var currScale=0.9;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }
    



    return Transform(
      transform: matrix,
      child: Stack(
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
        
      ),
    );
  }
}
