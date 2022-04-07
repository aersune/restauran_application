import 'package:flutter/material.dart';
import 'package:restaurant_recipe/pages/dishes_page.dart';
import 'package:restaurant_recipe/pages/salads_page.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bgColor = Color(0xff2A5270);
  int _selectedIndex = 0;

  List<Widget> _pages = [
    DishesPage(),
    SaladsPage(),
    SaladsPage(),
    SaladsPage(),
  ];

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
                leading: Column(
                  children: [
                    SizedBox(height: 120,),
                    ToggleButtons(children: [
                      Icon(Icons.call),
                      Icon(Icons.add),
                      Icon(Icons.cake),
                    ], isSelected: [true,false, false,])
                  ],
                ),
                groupAlignment: 0.5,
                labelType: NavigationRailLabelType.all,
                backgroundColor: _bgColor,
                  selectedIndex: _selectedIndex,
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
