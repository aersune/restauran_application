import 'dart:core';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:restaurant_recipe/models/meals.dart';
import 'package:restaurant_recipe/pages/details_page.dart';

class DishesPage extends StatefulWidget {
  const DishesPage({Key? key}) : super(key: key);

  @override
  State<DishesPage> createState() => _DishesPageState();
}
  var  _selectedIndex =0;
class _DishesPageState extends State<DishesPage> {
 var _blueColor = const Color(0xff175B8F);

 final List<Color> _colors = const[
   Color(0xffF2DFE1),
   Color(0xffDCC7B1),
   Color(0xffFFC5A8),
   Color(0xff71C3A1),
   Color(0xffA8B6FF),
   Color(0xffFFE7A8),
   Color(0xffCEA8FF),
 ];

 bool _isMealSelected = false;

 bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        _isMealSelected ?
        setState(() {
          _isMealSelected =false;
        }):
        Navigator.pop(context);
        return Future.value(false);
      },
      child: SafeArea(child:  _isMealSelected
          ? DetailsPage(mealIndex: _selectedIndex, back: () { setState(() {
            _isMealSelected = !_isMealSelected;
            print('asdadw');
          }); },)
          : LayoutBuilder(builder: (BuildContext contex, BoxConstraints constraints){
              return mainUi(constraints);
      })
      ),
    );
  }

  Widget mainUi(BoxConstraints constraints){

    var axisCount = 1;
    var posRight = 20.0;
    var currentWidth = constraints.maxWidth;

    if(currentWidth <= 559){
        axisCount = 1;
        posRight = 20.0;
    }else if(currentWidth > 559 && currentWidth <= 838){
        axisCount = 2;
        posRight =  0.0;
    }else if (currentWidth > 838 && currentWidth <= 1130){
        axisCount =  3;
        posRight = -10.0;
    }else{
        axisCount =  4;
        posRight = -10.0;
    }

    print("CURRENT WIDTH : ${constraints.maxWidth}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(left: 12,top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("title1".tr() ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text("title2".tr(),style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: _blueColor),),
                ],
              ),
              Text("title3".tr(),style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: _blueColor),),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Expanded(
          child: GridView.builder(
            itemCount: 7,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: axisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 60,
              mainAxisExtent: 400,
            ),
            itemBuilder: (BuildContext context, int index ){
              return meal(Meal.meals[index], index, posRight);
            },
          ),
        )
      ],
    );
  }

  Widget meal(Meal meal, index, posRight,){


    return Padding(
      padding:  EdgeInsets.only(top: 50,),
      child: SizedBox(
        width: 260,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          // alignment: Alignment.centerLeft,
          children: [
            InkWell(
              onTap: () => null,
              onHover: (hovering){
                setState(() {
                  isHovering = hovering;
                });
              },
              hoverColor: Colors.grey.withOpacity(0.5),
              child: Card(
                elevation: 48,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: 260,
                  height: 360,
                  decoration: BoxDecoration(
                      color: Color(meal.bannerColor),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,top: 80, right: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only( right: 10),
                              height: 20,
                              width: 5,
                              decoration: BoxDecoration(
                                  color: Color(0xff00195C),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                            Text('Кавказская' ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600, color: Color(0xff00195C)),),
                          ],
                        ),

                        Container(
                          margin: const EdgeInsets.only(top: 16, bottom: 20),
                          child:  Text(meal.name + ' \n'  ,style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700,),maxLines: 2,),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Стоимость:" , style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff52616B)),),
                            Text(meal.cost,style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff52616B)),),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ImageIcon(AssetImage('assets/icons/cooking_time.png',),size: 20,),
                                SizedBox(width: 10,),
                                Text(meal.time, style: TextStyle(fontWeight: FontWeight.w300, color: Color(0xff11263C)),)
                              ],
                            ),
                            Row(
                              children: [
                                ImageIcon(AssetImage('assets/icons/in2.png',),size: 20,),
                                SizedBox(width: 10,),
                                Text(meal.inCount.toString() + ' инг',style: TextStyle(fontWeight: FontWeight.w300, color: Color(0xff11263C)),)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff175B8F).withOpacity(0.35),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                width: 40,
                                height: 40,
                                child: Center(
                                  child: Icon(Icons.add_circle_outline_rounded, color: Color(0xff002DA4),),
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            InkWell(
                              onTap: (){
                                  setState(() {
                                     _isMealSelected = true;
                                     _selectedIndex = index;
                                  });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff175B8F),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                width: 150,
                                height: 40,
                                child: Center(
                                  child: Text('Подробнее', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600 ,color: Colors.white),),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -50,
              right: posRight,
              child: Image.asset(meal.imageUrl ,scale: 2,),)
          ],
        ),
      ),
    );
  }
}

