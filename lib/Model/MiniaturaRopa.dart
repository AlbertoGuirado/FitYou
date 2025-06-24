
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/Constant.dart';

import '../Model/Item.dart';




class MiniaturaRopa extends StatefulWidget {
  final Item ropa;


  MiniaturaRopa({required this.ropa});

  @override
  State<MiniaturaRopa> createState() => _MiniaturaRopa(ropa);
}


class _MiniaturaRopa extends State<MiniaturaRopa> {

  _MiniaturaRopa(this.ropa);

  final Item ropa;
  @override
  Widget build(BuildContext context) {
    String path = ropa.img;

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

    final isAsset = path.startsWith('assets/');

    File file = File(path);
    bool delPropioUser = false;
    if(ropa.autor == usuarioPrin.nombre){
      delPropioUser=true;
    }

    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///IMAGEN E ICONO
          Stack(
            children: [
              isAsset ?
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],

                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: internet ? imageProvider :AssetImage(path),
                      )
                  ),
                ),
              )
                  :
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: internet ? imageProvider : FileImage(File(path)),
                    ),
                  ),
                ),
              ),
              ///MODIFICAR Y PONERLE --------------------
              delPropioUser ? Container()
                  :
              Positioned(
                  right: 10,
                  top: 10,
                  child: _favIcon()),

            ],
          ),

          ///
          const SizedBox(height: 10,),
          Text(
            ropa.nombre,
            maxLines: 1,
            style: TextStyle(
              color: Color(0xff444444),
            ),
          ),
          Text(tienda()),
        ],
      ),
    );

  }
  String tienda(){
    final f = ropa.link.split("/");
    String tienda = f[0];
    return tienda;
  }
  Widget _favIcon(){
    return GestureDetector(
      child: Icon(
        size: 30,
        ropa.fav ? Icons.favorite : Icons.favorite_border,
        //color: this.widget.themeDark ? Colors.white : Colors.black54,
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
            //ServicioRopasFav().fitYouClothes.add(this.widget.ropa);
            ///
            //subirItem();
            //subirItem();
            ///
          }else{
            usuarioPrin.ropafav.remove(this.widget.ropa);

          }
        });
      },
    );
  }

}
