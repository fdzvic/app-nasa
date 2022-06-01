
import 'package:flutter/material.dart';
import 'package:miprimeraapp/home/screen/widgets/listImage.dart';
import 'package:miprimeraapp/home/screen/widgets/menuapp.dart';
import 'package:miprimeraapp/shared/widgets/appbar.dart';
import 'package:miprimeraapp/shared/widgets/bottonNavyBar.dart';


class Aplication extends StatelessWidget {
  const Aplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarAplication(),
        body: Column(
          children: const [
            MenuApp(),
            ListaOpciones(),
          ],
        ),   
        bottomNavigationBar: BotomNavigator()        
        
      );
  }
}
