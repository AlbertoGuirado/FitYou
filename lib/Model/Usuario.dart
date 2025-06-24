import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/image.dart';
import 'package:http/http.dart';
import 'dart:io';
import 'Item.dart';

class Usuario{
  String nombre;
  String email;
  String password;
  List<Item> ropa;
  List<Item> ropafav;
  Image fotoPerfil;
  /*Usuario({
    required this.nombre,
    required this.email,
    required this.password,
    required this.ropa,
    required this.fotoPerfil,
  }) : ropafav = []; */// Inicializa ropafav como una lista vacía
  Usuario({
    required this.nombre,
    required this.email,
    required this.password,
  }) : ropafav = [], ropa = [], fotoPerfil = Image.asset("assets/imgs/profileDef.png"); // Inicializa ropafav y ropa como una lista vacía

}
/*
class ServicioRopasDelUser {
  List<Item> fitYouClothes = [
    Item("sneakers 2",
      'Colors.green',
      'assets/imgs/tred.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      54,
    ),
    Item("sneafkers 2",
      'Colors.green',
      'assets/imgs/dunk.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      54,
    ),
    Item("sneakers 2",
      'Colors.green',
      'assets/imgs/dunk.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      54,
    ),
    Item("sneakersf 2",
      'Colors.green',
      'assets/imgs/dunk.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      54,
    ),
    Item("sneakers 2",
      'Colors.green',
      'assets/imgs/dunk.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      54,
    ),
    Item("sneakers ssss2",
      'Colors.green',
      'assets/imgs/or1.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      54,
    ),
    Item("tshirt",
      'Colors.red',
      'assets/imgs/fit1.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      54,
    ),
    Item("Dunks Ben & Jerry",
      'Colors.blue',
      'assets/imgs/s1.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      54,
    ),
    Item("NIKE DssUNK",
      'Colors.deepOrange,',
      'assets/imgs/tgreen.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      54,
    ),
  ];
  Future<String> _cargarDesdeHttp(String url) async {
    final urlComprobada = Uri.parse(url);
    final respuesta = await get(urlComprobada);

    if (respuesta.statusCode == HttpStatus.ok) {
      return respuesta.body;
    } else {
      return '';
    }
  }

  Future<List<Item>> getRopas() async {
    /*final cadenaLeidaServidor = await
    _cargarDesdeHttp("https://www.themealdb.com/api/json/v1/1/filter.php?i=chicken");
    final Map<String, dynamic> json = jsonDecode(cadenaLeidaServidor);
    if(json['meals'] != null){
      final recetas = <RecetaBasica>[];
      for(var receta in json['meals']){
        recetas.add(RecetaBasica.fromJson(receta));
      }*/
    return fitYouClothes;
    //}else return [];
  }
}
*/
/*
class ServicioRopasFav {
  List<Item> fitYouClothes = [
    Item("sneakers 2",
      'Colors.green',
      'assets/imgs/tred.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      54,
    ),
  ];

  Future<String> _cargarDesdeHttp(String url) async {
    final urlComprobada = Uri.parse(url);
    final respuesta = await get(urlComprobada);

    if (respuesta.statusCode == HttpStatus.ok) {
      return respuesta.body;
    } else {
      return '';
    }
  }

  Future<List<Item>> getRopas() async {
    /*final cadenaLeidaServidor = await
    _cargarDesdeHttp("https://www.themealdb.com/api/json/v1/1/filter.php?i=chicken");
    final Map<String, dynamic> json = jsonDecode(cadenaLeidaServidor);
    if(json['meals'] != null){
      final recetas = <RecetaBasica>[];
      for(var receta in json['meals']){
        recetas.add(RecetaBasica.fromJson(receta));
      }*/
    return fitYouClothes;
    //}else return [];
  }
}
*/