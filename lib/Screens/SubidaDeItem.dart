import 'dart:io';

import 'package:app/Model/Item.dart';
import 'package:app/Screens/MainScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../Components/Constant.dart';
import '../Model/LoadingScreen.dart';

class SubidaDeItem extends StatefulWidget {
  File foto;

  SubidaDeItem(this.foto);

  @override
  State<SubidaDeItem> createState() => _SubidaDeItemState(foto);
}

class _SubidaDeItemState extends State<SubidaDeItem> {
  File foto = File("");
  String titulo = "";
  String descripcion = "";
  String tienda = "";
  String talla = "";
  double precio = 0.0;

  _SubidaDeItemState(this.foto);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String f = foto.path;
    print("-...........$f");
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  MainScreen(),
                              ),
                            );
                            },
                          icon: Icon(Icons.keyboard_backspace)
                      ),
                      Text("AÑADE UNA NUEVA PRENDA",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                              fontSize: 20,
                              color: grisPrincipal
                          ),
                      ),
                    ],
                  ),
                ),
                ///IMAGEN
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: grisPrincipal),
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: FileImage(foto),
                      fit: BoxFit.scaleDown,
                    )
                  ),
                  height: 200,
                ),
                SizedBox(height: 30,),
                ///TITULO
                TextField(
                  onChanged: (value){
                    setState(() {
                      titulo = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                     hoverColor: Color(0xfff0000),
                    labelText: "Titulo",
                  ),
                ),
                SizedBox(height: 20,),
                ///DESCR
                Container(
                  child: TextField(
                    onChanged: (value){
                      setState(() {
                        descripcion = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      //label: Text('t'),
                      labelText: "Descripcion",
                      alignLabelWithHint: true,
                      hoverColor: Color(0xfff0000),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                ///ENLACE
                TextField(
                  onChanged: (value){
                    setState(() {
                      tienda = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hoverColor: Color(0xfff0000),
                    labelText: "Link de la tienda",
                  ),
                ),
                SizedBox(height: 20,),
                ///TALLA Y PRECIO
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: size.width*0.5,

                      ///TALLA
                      child: TextField(
                        onChanged: (value){
                          setState(() {
                            talla = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          icon: Icon(Icons.format_size),
                          labelText: "Talla",
                        ),
                      ),

                    ),
                    Container(
                      height: 60,
                      width: size.width/3,

                      ///PRECIO
                      child: TextField(
                        onChanged: (value){
                          setState(() {
                            String p = value;
                            double d = double.parse(p);
                            precio = d;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          icon: Icon(Icons.euro),
                          labelText: "Precio",
                          hoverColor: Color(0xfff0000),
                        ),
                      ),

                    )
                  ],
                ),
                SizedBox(height: 30,),
                RawMaterialButton(
                  onPressed: () async {
                    print("NUMERO DE ITEMS DEL USER: ${usuarioPrin.ropa.length}");
                    final image = FileImage(foto);


                    //foto.path = image.file.path;

                    Item item = Item(titulo, descripcion, image.file.path, tienda, talla, precio, usuarioPrin.nombre);

                    usuarioPrin.ropa.add(item);
                    //ServicioRopasDelUser().fitYouClothes.add(item);

                    ///lo metemos en la lista del usuario
                    String? userId = FirebaseAuth.instance.currentUser?.uid;

                    FirebaseStorage storage = FirebaseStorage.instance;
                    Reference ref = storage.ref().child(foto.path);
                    File file = File(item.img);
                    UploadTask uploadTask = ref.putFile(file);
                    String imageUrl = await (await uploadTask).ref.getDownloadURL();
                    try {
                      FirebaseFirestore.instance.collection('users').doc(usuarioPrin.email).collection("ownItems").doc().set({
                        'Titulo': titulo,
                        'Descripcion': descripcion,
                        'Tienda': tienda,
                        'imagen': imageUrl,
                        'talla': talla,
                        'Precio': precio,
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('ITEM SUBIDO'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      print("NUMERO DE ITEMS DEL USER: ${usuarioPrin.ropa.length}");
                      Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => LoadingScreen(),
                          )
                      );
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.pushReplacement(
                          context,
                            MaterialPageRoute(
                              builder: (context) =>  MainScreen(),
                            )
                        );
                      });
                    }catch(e){
                      print("error $e");


                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('ERROR'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    };
                    print("SUBIENDO ITEM");

                   },

                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Subir",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
