
import 'dart:ui';
import 'package:app/Components/Constant.dart';
import 'package:flutter/material.dart';

class Item {
  String nombre;
  //Color color;
  String descripcion;
  late bool fav=false;
  final String img;
  //late String tienda;
  //bool fav;
  late Widget icono;
  double precio;
  String link;
  String talla;
  String autor;

  Item(this.nombre, this.descripcion, this.img, this.link, this.talla, this.precio, this.autor);

  Image getImage(){
    Image m = Image.asset(img);
    return m;
  }
  void setIcono(){

    if(nombre.toLowerCase().contains("hoodie")){
      icono = IconHoodie;
    }else if(nombre.toLowerCase().contains("pant")){
      icono = IconCargo;
    }else if(nombre.toLowerCase().contains("polo")){
      icono = IconPolo;
    }else if(nombre.toLowerCase().contains("short")){
      icono = IconShort;
    }else if(nombre.toLowerCase().contains("tshirt")){
      icono = IconTshirt;
    }else if(nombre.toLowerCase().contains("sneaker") || nombre.toLowerCase().contains("zapatillas")){
      icono = IconSneakers;
    }else if(nombre.toLowerCase().contains("pants") || nombre.toLowerCase().contains("jeans")){
      icono = IconPants;
    }else icono = IconCargo;

  }
  Future<double> aspect() async {

    Image m = await getImage();

    double? d = m.width;
    double? h = m.height;
    double a = d!/h!;
    return a;
  }
}
