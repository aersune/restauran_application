import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_recipe/models/meals.dart';
class DetailsPage extends StatelessWidget {
  final VoidCallback back;
  final mealIndex;
  const DetailsPage({Key? key, required this.mealIndex, required this.back}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0,top: 30),
              child: InkWell(
                onTap: back,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
            ),
            details(),
          ],
        )),
      ),
    );
  }
  Widget details(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, right: 40),
          color: Colors.white,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 130.0, left: 15,right: 15),
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
                        const Text('????????????????????' ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600, color: Color(0xff00195C)),),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16, bottom: 20),
                      child:  Text(Meal.meals[mealIndex].name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,),),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ImageIcon(AssetImage('assets/icons/cooking_time.png',),size: 20,),
                            SizedBox(width: 10,),
                            Text(Meal.meals[mealIndex].time, style: TextStyle(fontWeight: FontWeight.w300, color: Color(0xff11263C)),)
                          ],
                        ),
                        Row(
                          children: [
                            ImageIcon(AssetImage('assets/icons/in2.png',),size: 20,),
                            SizedBox(width: 10,),
                            Text(Meal.meals[mealIndex].inCount.toString() + ' ??????',style: TextStyle(fontWeight: FontWeight.w300, color: Color(0xff11263C)),)
                          ],
                        ),
                        Row(
                          children: const [
                            ImageIcon(AssetImage('assets/icons/olov.png',),size: 20,),
                            SizedBox(width: 10,),
                            Text('438 ??????',style: TextStyle(fontWeight: FontWeight.w300, color: Color(0xff11263C)),)
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const Text("?????? ???? ?????? ???? ????????????????, ?? ?????????? ?????????????? ???????????? ???????????????????? ???? ????????????????. ???????? ???????????? ???????? ??????????. ???? ???????????? ???????????????????? ???????????? ???????????????????? ????????????????, ?????? ?????????????? ???? ?????????? ????????????????????. \n \n ???? ????????, ???????? ???????? ???????????? ???? ?????????????? ??????????, ???????????? ?????????? ?????????????????????? ???? ???????? ?????? ???????????????? ?????? ?????? ??????????????. ?????????? ???????????????? ?????????????? ????????????????. ???? ???? ??????????????, ?????? ???????????? ?????????? ????????, ?? ???? ??????????????, ?????????????? ???????????????? ?????????? ???????????? ??????????????" ,
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 15
                    ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Text('?????????????????????? ' + '(' + Meal.meals[mealIndex].inCount.toString()+ ')', style: TextStyle(color: Color(0xff1E2022), fontSize: 20, fontWeight: FontWeight.w600),)
                      ],
                    ),
                    const SizedBox(height: 16,),
                    Wrap(
                      // crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        ingredient('assets/images/lagmon_hamir.png', '??????????'),
                        ingredient('assets/images/krivetka.png', '????????????????'),
                        ingredient('assets/images/un.png', '???????????????????? ????????'),
                        ingredient('assets/images/tuxum.png', '??????'),
                        ingredient('assets/images/pomidor.png', '??????????????'),
                      ],
                    ),
                    const SizedBox(height: 50,)

                  ],
                ),
              ),
              Positioned(
                top: -60,
                right: -20,
                  child: Image.asset(Meal.meals[mealIndex].imageUrl,scale: 1.5,),
              ),
            ],
          )
        ),
      ],
    );
  }
}

Widget ingredient(image,title){
  return   Container(
    padding: EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, scale: 2,),
        SizedBox(height: 10,),
        Text(title)
      ],
    ),
  );
}