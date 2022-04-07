import 'package:flutter/material.dart';
import 'package:restaurant_recipe/pages/dishes_page.dart';
import 'package:restaurant_recipe/pages/salads_page.dart';

import '../models/lang.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bgColor = Color(0xff2A5270);
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DishesPage(),
    SaladsPage(),
    SaladsPage(),
    SaladsPage(),
  ];

  List<Lang> _langs = [
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
            NavigationRail(
              minWidth: 54,
              onDestinationSelected: (int index){
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedIndex: _selectedIndex,
              leading: Column(
                children: [
                  SizedBox(height: 100,),
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
                      });
                    },
                    direction: Axis.vertical,
                      children: [
                    langButton(_langs[0]),
                    langButton(_langs[1]),
                    langButton(_langs[2]),

                  ],isSelected: _langs.map((e) => e.isActive).toList(),)
                ],
              ),
              groupAlignment: 0.5,
              labelType: NavigationRailLabelType.all,
              backgroundColor: _bgColor,
              selectedLabelTextStyle: TextStyle(color: Colors.white, fontSize: 24),
              unselectedLabelTextStyle: TextStyle(color: Colors.white60, fontSize: 20),
              destinations: const [
                NavigationRailDestination(
                    icon: SizedBox.shrink(),
                    label: RotatedBox(
                      quarterTurns: -1,
                      child: Text('Блюда'),
                    )),
                NavigationRailDestination(
                    icon: SizedBox.shrink(),
                    label: RotatedBox(
                      quarterTurns: -1,
                      child: Text('Салаты'),
                    )),
                NavigationRailDestination(
                    icon: SizedBox.shrink(),
                    label: RotatedBox(
                      quarterTurns: -1,
                      child: Text('Напитки'),
                    )),
                NavigationRailDestination(
                    icon: SizedBox.shrink(),
                    label: RotatedBox(
                      quarterTurns: -1,
                      child: Text('Fast Food'),
                    )),
              ],
            ),
            Expanded(child: _pages[_selectedIndex]),
          ],
        ),
      ),
    );
  }
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