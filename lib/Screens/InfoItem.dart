import 'dart:io';

import 'package:app/Model/Item.dart';
import 'package:app/Screens/Armario.dart';
import 'package:app/Screens/MainScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Components/Constant.dart';

class InfoItem extends StatefulWidget {
  Item ropa;
  InfoItem({required this.ropa, Key? key}) : super(key: key);
  @override
  State<InfoItem> createState() => _InfoItemState();
}

class _InfoItemState extends State<InfoItem> {

  @override
  Widget build(BuildContext context) {
    Image m = widget.ropa.getImage();
    return Scaffold(
      body: Cuerpo(ropa: widget.ropa),
    );
    /*return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () { Navigator.pop(context); },
        ),
      ),
      body: Column(
        children: [
          Container(),
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.ropa.img),
              ),
            ),
          ),
        ],
      ),
    );*/
  }
}


class Cuerpo extends StatefulWidget {
  Item ropa;
  Cuerpo({required this.ropa, Key? key}) : super(key: key);
  @override
  State<Cuerpo> createState() => _CuerpoState();
}

class _CuerpoState extends State<Cuerpo> {

  Future<void> _launchInBrowser(String url) async {
    List<String> urlParts = url.split('/');
    print("------ ${urlParts[1]}/${urlParts[2]}");
    final Uri uri = Uri(scheme: "https",host: urlParts[0] , path: urlParts[1]+"/"+urlParts[2]);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,)
    ){
      throw Exception('Could not launch ------------------------------ $url');
    }
  }
  void actualizaListaRopaConIcono(){
      widget.ropa.setIcono();
  }
  @override
  Widget build(BuildContext context) {
    actualizaListaRopaConIcono();
    final Uri toLaunch = Uri(scheme: 'https', host: 'www.lipsum.com');
    Size size = MediaQuery.of(context).size;
    print("omaaa ${widget.ropa.img}");

    final delUsu = widget.ropa.autor == usuarioPrin.nombre;


    bool orienta =  true ;
    return Column(
      children: [
        SizedBox(height: 60,),
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
              onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.keyboard_backspace)
          ),
        ),
        ///ESTRUCTURA PRINCIPAL
        Center(
          child: Container(
            height: size.width*1.25,
            width: size.width*0.9,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///CUADRO EXTERIOR
                ///SI LA IMAGEN ES MAS ANCHA QUE LARGA, SE REPRESENTA DIFERENTE

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  ///IMAAAAGEN
                  child: widget.ropa.icono == IconSneakers ? horizontal() : vertical(),
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:20,left: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              widget.ropa.nombre,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                          ),
                          Text(
                            tienda(),
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),



                    Row(
                      children: [

                        delUsu ? botonEliminar() : meterFavs(),


                        SizedBox(width: 15,),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: ElevatedButton(
                            ///BOTON DE COMPRAR
                            onPressed: () async {

                              _launchInBrowser(widget.ropa.link);
                            },
                            style: ButtonStyle(
                              enableFeedback: false,
                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xfff8f8f9)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.black),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(Size(100, 50)),
                            ),
                            child: Text('Comprar',style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            )


                            ),
                          ),
                        ),


                      ],
                    ),


                  ],
                ),
                //SizedBox(height: 65,),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 15),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[300],
                              ),
                              child: ClipOval(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/imgs/perfil.jpg"),
                                ),
                              ),
                            ),
                          ),
                          Text(usuarioPrin.nombre, style: TextStyle(
                            color: grisPrincipal,
                          ),),
                        ],
                      ),


                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Icon(Icons.share),
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),

      ],
    );
  }
  Widget meterFavs(){
    return GestureDetector(
      child: Icon(
        size: 30,
        this.widget.ropa.fav ? Icons.favorite : Icons.favorite_border,
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
          }else
            usuarioPrin.ropafav.remove(this.widget.ropa);
        });
      },
    );
  }
  Widget botonEliminar(){
    return ElevatedButton(
      ///BOTON DE COMPRAR
      onPressed: () async {
        usuarioPrin.ropa.remove(widget.ropa);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MainScreen()
            )
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Eliminado', style: TextStyle(
              color: grisSecund,
              fontWeight: FontWeight.bold
            )),
            backgroundColor: Colors.greenAccent,
            action: SnackBarAction(
              label: 'Deshacer',
              textColor: Colors.redAccent,
              onPressed: () {
                usuarioPrin.ropa.add(widget.ropa);
                setState(() {});
              },
            ),
          ),
        );
        setState(() {});
      },
      style: ButtonStyle(
        enableFeedback: false,
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xfff8f8f9)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.black),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(Size(100, 50)),
      ),
      child: Text('Eliminar',style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold
      )


      ),
    );
  }
  Widget vertical(){
    final internet = widget.ropa.img.startsWith("https");
    final isAsset = widget.ropa.img.startsWith('assets/');
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
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///CUADRO EXTERIOR
        ///SI LA IMAGEN ES MAS ANCHA QUE LARGA, SE REPRESENTA DIFERENTE
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(

            children: [
              isAsset ?
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(
                    offset: Offset(0,10),
                    blurRadius: 60,
                    color: kSecColor.withOpacity(0.19),
                  )],
                  image: DecorationImage(
                    alignment: Alignment.center,
                    fit: BoxFit.fitHeight,
                    image: imageProvider,
                  ),
                ),
                height: MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width*0.4,
              )
                  :
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  height: 270,
                  width: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: internet ? imageProvider : FileImage(File(widget.ropa.img)),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),


        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              child: Text("About",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: grisSecund
                  ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 120,
                child: Text(widget.ropa.descripcion),
            ),
          ],
        ),

      ],

    );

  }
  Widget horizontal(){

    final internet = widget.ropa.img.startsWith("https");
    final isAsset = widget.ropa.img.startsWith('assets/');
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


    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ///CUADRO EXTERIOR
        ///SI LA IMAGEN ES MAS ANCHA QUE LARGA, SE REPRESENTA DIFERENTE
        isAsset ?
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(
              offset: Offset(0,10),
              blurRadius: 60,
              color: kSecColor.withOpacity(0.19),
            )],
            image: DecorationImage(
              alignment: Alignment.center,
              fit: BoxFit.fill,
              image: imageProvider,
            ),
          ),
          height: MediaQuery.of(context).size.height*0.2,
          width: MediaQuery.of(context).size.width*0.8,
        )
        :
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.3,
            width: MediaQuery.of(context).size.width*0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FractionalTranslation(
                translation: Offset(0.0,0.0),
                child: Image(
                  image: internet ? imageProvider : FileImage(File(widget.ropa.img)) ,
                  fit: BoxFit.cover,

                ),
              ),
            ),
          ),
        ),
        ///ESTRUCTURA DE LOS COLORES
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Container(
            width: 300,
            child: Text(widget.ropa.descripcion),
          ),
        ),
      ],

    );

  }
  String tienda(){
    final f = widget.ropa.link.split("/");
    String tienda = f[0];
    return tienda;
  }

}


