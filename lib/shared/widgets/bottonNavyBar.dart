import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class BotomNavigator extends StatefulWidget {
  @override
  State<BotomNavigator> createState() => _BotomNavigatorState();
}

class _BotomNavigatorState extends State<BotomNavigator> {
  int currentIndex = 0;

  BottomNavyBarItem _ItemBottomBar({required IconData icon, required String text}) {

    return BottomNavyBarItem(
        icon: Icon(icon, color: Colors.black45,), 
        title: Text(text, style: TextStyle(color: Colors.black38),),
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: currentIndex,
      onItemSelected: (index){
        setState(() {
          currentIndex = index;
        });
      },
      items:[
        
        _ItemBottomBar(icon:Icons.home ,text:'Home'),
        _ItemBottomBar(icon:Icons.calendar_month ,text:'Calendar'),
        _ItemBottomBar(icon:Icons.search ,text:'Search'),
        _ItemBottomBar(icon:Icons.favorite ,text:'Favorite'),
      ], 
    );
  }
}

