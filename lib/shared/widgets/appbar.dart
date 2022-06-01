 
 import 'package:flutter/material.dart';
import 'package:miprimeraapp/shared/widgets/bottomCircule.dart';

class AppBarAplication extends StatelessWidget implements PreferredSizeWidget{

   const AppBarAplication({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          BottomCircule(color: Colors.white, onPressed: (){}, icon: Icons.notifications),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: BottomCircule(color: Colors.white, onPressed: (){}, icon: Icons.settings,),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: const Image(
              image: AssetImage('assets/logonasa.png'),
              fit: BoxFit.fitWidth,
              ),
          ),
        ),
        leadingWidth: 150,
        toolbarHeight: 120,
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}