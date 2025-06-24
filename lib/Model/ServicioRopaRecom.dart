
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:io';
import 'Item.dart';

class ServicioRopasRecom {


  List<Item> fitYouClothes1 = [
    Item("Cargo Pants 2",
        'Colors.green',
        'assets/imgs/tred.jpg',
        'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
        'talla',
      54,"sistema"
    ),
    Item("CargoPants",
        'Colors.red',
        'assets/imgs/s1.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      54,"sistema"
    ),
    Item("Dunks Ben & Jerry",
        'Colors.blue',
        'assets/imgs/s2.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      54,"sistema"
    ),
    Item("NIKE DssUNK",
        'Colors.deepOrange,',
        'assets/imgs/pant.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      54,"sistema"
    ),
  ];

  List<Item> fitYouClothes2 = [
    Item("JACKET",
        'Colors.red',
        'assets/imgs/p3.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      54,"sistema"
    ),
    Item("Jeans wide skate",
        'Colors.deepOrange',
        'assets/imgs/pant.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      54,"sistema"
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

  Future<List<Item>> getRopas1() async {
    /*final cadenaLeidaServidor = await
    _cargarDesdeHttp("https://www.themealdb.com/api/json/v1/1/filter.php?i=chicken");
    final Map<String, dynamic> json = jsonDecode(cadenaLeidaServidor);
    if(json['meals'] != null){
      final recetas = <RecetaBasica>[];
      for(var receta in json['meals']){
        recetas.add(RecetaBasica.fromJson(receta));
      }*/
    return fitYouClothes1;
    //}else return [];
  }
  Future<List<Item>> getRopas2() async {
    /*final cadenaLeidaServidor = await
    _cargarDesdeHttp("https://www.themealdb.com/api/json/v1/1/filter.php?i=chicken");
    final Map<String, dynamic> json = jsonDecode(cadenaLeidaServidor);
    if(json['meals'] != null){
      final recetas = <RecetaBasica>[];
      for(var receta in json['meals']){
        recetas.add(RecetaBasica.fromJson(receta));
      }*/
    return fitYouClothes2;
    //}else return [];
  }
}