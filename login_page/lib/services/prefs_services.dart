import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static final String _key = 'key';

  //salvando a String atraves do setString

  static save(String user) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode({'user': user, 'isAuth': true}));
  }

  static Future<bool> isAuth() async {
    var prefs = await SharedPreferences.getInstance();

    var jsonResult = prefs.getString(_key);

    if (jsonResult != null) {
      var mapUser = jsonDecode(jsonResult);
      return mapUser['isAuth'];
    }
    return false;
  }

  static logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}


//gero uma unica instancia chamada prefs, uso ela pra definir minha String
// gero uma key para ter acesso a estes dados, coloco os meus dados dentro
//do valor em formato de json chamando user de user e isAuth de true
// faço outra função de autenticação chamo uma var jsonResult aloco nela 
//chamando minha instancia a minha key que me da acesso aos dados json
//verifico se e null, se não for crio uma var coloco dentro dela os meus
//dados em json ja interpretando eles para manipular 
//retorno uma verificação, se isAuth for verdadeiro esta correta
//a autenticação se não retorna falso
