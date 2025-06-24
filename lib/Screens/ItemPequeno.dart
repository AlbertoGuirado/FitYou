
import 'dart:ui';
import 'dart:io';

import 'package:app/Components/Constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Model/Item.dart';
import '../Model/Usuario.dart';

class ItemPequeno extends StatefulWidget{
  bool themeDark;
  Item ropa;
  ItemPequeno(this.ropa, {this.themeDark= false});

  @override
  State<ItemPequeno> createState() => _ItemPequenoState();
}

class _ItemPequenoState extends State<ItemPequeno> {
  double anchura = 400;

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    final internet = widget.ropa.img.startsWith("https");
    ImageProvider imageProvider = AssetImage("");
    if (!internet) {
      imageProvider = AssetImage(widget.ropa.img);
    } else {
      final networkImage = NetworkImage(widget.ropa.img);
      networkImage.resolve(const ImageConfiguration()).addListener(ImageStreamListener((imageStream, _) {
        setState(() {
          imageProvider = NetworkImage(imageStream.toString());
        });
      }));
    }
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, bottom: 20.0, top: 20.0),
      child: Container(
        decoration: _boxDecoration(context),
        child: Column(
          children: [
            ///IMAGEN

            Stack(
              children: [


                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                    image: DecorationImage(
                      image: internet ? imageProvider : AssetImage(widget.ropa.img),
                      fit: BoxFit.fitHeight,
                    ),
                    color:  this.widget.themeDark ? itemTemaOscuro : Colors.white, // if para el darkmode,
                  ),
                ),
                Positioned(
                    right: 10,
                    top: 10,
                    child: _favIcon()),
              ],
            ),
            SizedBox(height: 10,),
            SizedBox(height: 0,),
            ///INFO
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  _infoJobText(context),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }


  BoxDecoration _boxDecoration(context){
    return BoxDecoration(
      color: this.widget.themeDark ? itemTemaOscuro : Colors.white, // if para el darkmode
      //color: Color(0xFF4696FF),
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black45,
          offset: Offset(5.0, 4.0),
          blurRadius: 10.0,
        ),
      ],
    );
  }

  Widget _favIcon(){
    return GestureDetector(
      child: Icon(
        size: 30,
        this.widget.ropa.fav ? Icons.favorite : Icons.favorite_border,
        color: this.widget.themeDark ? Colors.white : Colors.black54,
      ),
      onTap: () {
        setState(() {
          this.widget.ropa.fav = !this.widget.ropa.fav;
          bool esta=false;
          for(int i=0;i<usuarioPrin.ropafav.length;i++){
            if(usuarioPrin.ropafav[i].nombre == this.widget.ropa.nombre){
              esta=true;
            }
          }
          if(!esta) {
            usuarioPrin.ropafav.add(this.widget.ropa);
            ///
            //subirItem();
            ///
          }else
            usuarioPrin.ropafav.remove(this.widget.ropa);
        });
      },
    );
  }


  Widget _infoJobText(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Product Sneadker',
          style: TextStyle(
            fontSize: 15.0,
            color: this.widget.themeDark
                ?
            Color(0xffffffff)
                :
            grisPrincipal,
          ),
        ),
        Text(
          this.widget.ropa.nombre,
          style: this.widget.themeDark
              ? Theme.of(context).textTheme.headline3
              : Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 5.0,),
        Row(
          children: <Widget>[
            Icon(
              Icons.location_on,
              color: Theme.of(context).highlightColor,
              size: 15.0,
            ),
            SizedBox(width: 5.0),
            Text(
              tienda(),
              style: TextStyle(
                fontSize: 15.0,
                color: this.widget.themeDark ?
                Color(0xFF4696FF) :
                Colors.grey,

              ),
            )
          ],
        )
      ],
    );
  }
  String tienda(){
    final f = widget.ropa.link.split("/");
    String tienda = f[0];
    return tienda;
  }


}

