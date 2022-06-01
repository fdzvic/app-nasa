import 'package:flutter/material.dart';
import 'package:miprimeraapp/home/screen/widgets/tabbar.dart';

import 'package:miprimeraapp/shared/widgets/bottomCircule.dart';


class MenuApp extends StatelessWidget {
  const MenuApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [ 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Favorites',style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                  const SizedBox(width: 120,),
                  BottomCircule(color: Colors.white, onPressed: (){}, icon: Icons.add,)
                ],
              ),
            ),
          ),

           Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: TabBarOptions()
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Happy Hours',style: TextStyle(fontSize: 25),),
                  const SizedBox(width: 120,),
                  BottomCircule(color: Colors.white, onPressed: (){}, icon: Icons.delete,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

