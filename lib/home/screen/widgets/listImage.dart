import 'package:flutter/material.dart';
import 'package:miprimeraapp/home/repository/gifs.dart';
import 'package:miprimeraapp/repository/http_gift.dart';


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