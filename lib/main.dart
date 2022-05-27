import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:miprimeraapp/services/http_gift.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        appBar: appBarStyle(),
        body: Column(
          children: const [
            MenuApp(),
            ListaOpciones(),
          ],
        ),   
        bottomNavigationBar: BotomNavigator()        
        
      )
    );
  }

  AppBar appBarStyle() {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          FloatingActionButton.small(
            onPressed: (){},
            child: Icon(Icons.notifications, color: Colors.black54),
            backgroundColor: Colors.white,
            
            ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: FloatingActionButton.small(
              onPressed: (){},
              child: Icon(Icons.settings_outlined, color: Colors.black54),
              backgroundColor: Colors.white,
              ),
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
}

class BotomNavigator extends StatefulWidget {
  @override
  State<BotomNavigator> createState() => _BotomNavigatorState();
}

class _BotomNavigatorState extends State<BotomNavigator> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: currentIndex,
      onItemSelected: (index){
        setState(() {
          currentIndex = index;
        });
      },
      items:<BottomNavyBarItem> [
        BottomNavyBarItem(
          icon: Icon(Icons.home, color: Colors.black45,), 
          title: Text('Home', style: TextStyle(color: Colors.black38),),
          activeColor: Colors.white,
          inactiveColor: Colors.white,
          ),
        BottomNavyBarItem(
          icon: Icon(Icons.calendar_month, color: Colors.black45,), 
          title: Text('Calendar', style: TextStyle(color: Colors.black38),),
          activeColor: Colors.white,
          inactiveColor: Colors.white,
          ),
        BottomNavyBarItem(
          icon: Icon(Icons.search, color: Colors.black45,), 
          title: Text('Search', style: TextStyle(color: Colors.black38),),
          activeColor: Colors.white,
          inactiveColor: Colors.white,
          ),
        BottomNavyBarItem(
          icon: Icon(Icons.favorite, color: Colors.black45,), 
          title: Text('Favorite', style: TextStyle(color: Colors.black38),),
          activeColor: Colors.white,
          inactiveColor: Colors.white,
          ),
        

      ], 
      );
  }
}

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
                  Text('Favorites',style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),

                  SizedBox(width: 120,),

                  FloatingActionButton.small(
                    child: Icon(Icons.add, color: Colors.black54),
                    backgroundColor: Colors.white,
                    onPressed: (){}
                    )
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
                  Text('Happy Hours',style: TextStyle(fontSize: 25),),

                  SizedBox(width: 120,),

                  FloatingActionButton.small(
                    child: Icon(Icons.delete, color: Colors.black54),
                    backgroundColor: Colors.white,
                    onPressed: (){}
                    )
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}

class TabBarOptions extends StatelessWidget {
  const TabBarOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: TabBar(
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.tab,
        splashBorderRadius: BorderRadius.circular(20),
        unselectedLabelColor: Colors.black87,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.orange

        ),

        tabs: [
          Tab(text: 'All',),
          Tab(text: 'Happy Hours',),
          Tab(text: 'Drinks',),
          Tab(text: 'Beer',),
        ]
      )
    );
  }
}

class ListaOpciones extends StatefulWidget {
  const ListaOpciones({
    Key? key,
  }) : super(key: key);

  @override
  State<ListaOpciones> createState() => _ListaOpcionesState();
}

class _ListaOpcionesState extends State<ListaOpciones> {
  late Future<List<Gif>> listadoGifs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listadoGifs = PeticionHttp().getGifs();
    print(listadoGifs);
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: listadoGifs,
        builder: (context, snapshot){
          if(snapshot.hasData){
            print(snapshot.data);
            return ListView(
              children: listaDeGifs(snapshot.data),
            );
          }else if(snapshot.hasError){
            print(snapshot.error);
            return Text('error');
          }
        return Center(child: CircularProgressIndicator());
        },
        )
    );
  }
    List<Widget>listaDeGifs(data){
      List<Gif> datos = data;
      List<Widget> gif =[];
      for (var gifs in datos) {
        gif.add(
          CardContainer(nombre: gifs.name, urlImagen: gifs.url)
        );
      }
      return gif;
     }
}

class CardContainer extends StatelessWidget {

  final String nombre;
  final String urlImagen;


  const CardContainer({super.key, required this.nombre, required this.urlImagen});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
     
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.keyboard_control_outlined))            
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter ,
                       children: [
                         Padding(
                        padding: const EdgeInsets.only(left: 8, bottom: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          width: 150,
                          height: 130,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage(
                              placeholder: AssetImage('assets/loading.gif',), 
                              image: NetworkImage(urlImagen),
                              fit: BoxFit.fill,
                              placeholderFit: BoxFit.fill,
                              ),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        child: Icon(Icons.favorite, color: Colors.orange,),
                        backgroundColor: Colors.white,
                        onPressed: (){}
                        )
                       ],
                    ),
                    
                  ],
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    nombre,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  
                    ),
                ),
              )
            ],
          )
        ],
          
      ),
      
    );
  }
}