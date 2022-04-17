import 'package:flutter/material.dart';
import 'package:restaurant_recipe/pages/dishes_page.dart';
import 'package:restaurant_recipe/pages/favorites.dart';
import 'package:restaurant_recipe/pages/salads_page.dart';
import 'package:easy_localization/easy_localization.dart';
import '../models/lang.dart';
import 'package:restaurant_recipe/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bgColor = Color(0xff2A5270);
  int _selectedIndex = 1;

  final List<Widget> _pages = const[
    FavoritePage(),
    DishesPage(),
    SaladsPage(),
    SaladsPage(),
    SaladsPage(),
  ];

  final List<Lang> _langs = [
    Lang('uz', true),
    Lang('ru', false),
    Lang('en', false),
  ];

  int _activeLangIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      minWidth: 54,
                      onDestinationSelected: (int index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      selectedIndex: _selectedIndex,
                      leading: lanBuild(),
                      groupAlignment: 0.5,
                      labelType: NavigationRailLabelType.all,
                      backgroundColor: _bgColor,
                      selectedLabelTextStyle: TextStyle(color: Colors.white,
                          fontSize: 24),
                      unselectedLabelTextStyle: TextStyle(color: Colors.white60,
                          fontSize: 20),
                      destinations: [
                        NavigationRailDestination(
                            icon: Icon(Icons.favorite_border, color: Colors.white,
                              ),
                            label: SizedBox.shrink(),
                        ),
                        NavigationRailDestination(
                            icon: SizedBox.shrink(),
                            label: RotatedBox(
                              quarterTurns: -1,
                              child: Text("meals".tr()),
                            )),
                        NavigationRailDestination(
                            icon: SizedBox.shrink(),
                            label: RotatedBox(
                              quarterTurns: -1,
                              child: Text("salads".tr()),
                            )),
                        NavigationRailDestination(
                            icon: const SizedBox.shrink(),
                            label: RotatedBox(
                              quarterTurns: -1,
                              child: Text("drinks".tr()),
                            )),
                        NavigationRailDestination(
                            icon: const SizedBox.shrink(),
                            label: RotatedBox(
                              quarterTurns: -1,
                              child: Text("fast_food".tr()),
                            )),
                      ],
                    ),
                  ),
                ),
              );
            }),
            Expanded(child: _pages[_selectedIndex]),
          ],
        ),
      ),
    );

  }

  Widget lanBuild(){
    return Column(
      children: [
        SizedBox(height: 10,),
        ToggleButtons(
          splashColor: Colors.transparent,
          borderColor: Colors.transparent,
          highlightColor: Colors.transparent,
          selectedColor: Colors.transparent,
          selectedBorderColor: Colors.transparent,
          fillColor: Colors.transparent,
          onPressed: (int index){
            setState(() {
              _langs.forEach((element) { element.isActive = false;});
              _langs[index].isActive = true;

              switch(index){
                case 0 : {
                  var newLocale = Locale('uz','UZ');
                    context.setLocale(newLocale);

                }break;
                case 1 : {
                  context.setLocale(Locale('ru','RU'));
                }break;
                case 2 : {
                  context.setLocale(Locale('en','US'));
                }
              }
            });
          },
          direction: Axis.vertical,
          children: [
            langButton(_langs[0]),
            langButton(_langs[1]),
            langButton(_langs[2]),

          ],isSelected: _langs.map((e) => e.isActive).toList(),),
      ],
    );
  }

  Widget langButton(Lang lang){
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: lang.isActive ?  const Color(0xff206498) : const Color(0xff2a5270),
      ),
      child: Text(lang.name, style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      alignment: Alignment.center,
    );
  }
}