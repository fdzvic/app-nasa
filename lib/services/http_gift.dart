import 'dart:convert';
import 'package:http/http.dart' as http;

class Gif {
  final String name;
  final String url;

 Gif(this.name, this.url);
}

class PeticionHttp{


  Future<List<Gif>> getGifs()async{
    final response = await http.get(Uri.parse('https://api.giphy.com/v1/gifs/search?api_key=lRYrpYFXOejJIOeZlyLfZvWPUbVozMXT&q=restaurantes&limit=10&offset=0&rating=g&lang=en'));

    List<Gif> gifs = [];
    if( response.statusCode == 200){
      final jsonData = jsonDecode(response.body);

      for (var item in jsonData['data']) {
        gifs.add(Gif(item['title'], item['images']['downsized']['url']));
      }

      return gifs;
    }else{
      throw Exception('error de conexion');
    }
  }
}
