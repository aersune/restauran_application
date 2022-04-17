import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
        itemBuilder: (BuildContext context, int index){
          return Text('awdwd ${index}');
        },
    );
  }
}
