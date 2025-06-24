import 'package:app/Components/Constant.dart';
import 'package:app/Model/LoadingScreen.dart';
import 'package:app/Model/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../Inicio.dart';
import '../Model/Item.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          customBar(),
        ],
        title: Text('Editar perfil',
          style: TextStyle(
            fontWeight:  FontWeight.w600,
            color: grisPrincipal,
          ),
        ),
        //iconTheme: IconThemeData(),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white70,
        elevation: 0,
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.keyboard_backspace)
                ),
              ),
              ///----------------------------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: ClipOval(
                    child: Image(
                      fit: BoxFit.cover,
                      //image: usu.fotoPerfil.image,
                      image: usuarioPrin.fotoPerfil.image,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 20),
                child: RawMaterialButton(
                  onPressed: () async {

                    _showPopupMenu();

                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Cambiar foto de perfil",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(80.0),
                child: RawMaterialButton(
                  onPressed: () async {
                    ///CERRAMOS SESION
                    subirItemFAVS();
                    await FirebaseAuth.instance.signOut();
                    usuarioPrin = Usuario(nombre: "", email: "", password: "");
                    usuarioPrin.ropafav = [];
                    usuarioPrin.ropa = [];
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => LoadingScreen(),
                        )
                    );

                    Future.delayed(Duration(seconds: 1), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "CERRAR SESION",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),


            ],
          ),
        )
    );
  }

  void _showPopupMenu() {
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;
    final Size screenSize = MediaQuery.of(context).size;
    final double centerX = screenSize.width / 2;
    final double centerY = screenSize.height / 2;

    final RelativeRect position = RelativeRect.fromLTRB(
      centerX - 110, // left
      centerY - 100, // top
      centerX + 100, // right
      centerY + 100, // bottom
    );

    showMenu(
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          child: Row(
            children: const [
              Icon(Icons.camera_alt),
              SizedBox(width: 8.0),
              Text('Tomar foto', style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700
              )),
            ],
          ),
          value: 0,
        ),
        PopupMenuItem(
          child: Row(
            children: const [
              Icon(Icons.image),
              SizedBox(width: 8.0),
              Text('Seleccionar de galería',
                  style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700)
              )
            ],
          ),
          value: 1,
        ),
      ],
      elevation: 8.0,
    ).then((selectedValue) {
      if (selectedValue != null) {
        // Do something based on the selected value
        print('Selected value: $selectedValue');
        selImagen(selectedValue);
      }
    });
  }
  final picker = ImagePicker();
  late File img;
  Future<void> selImagen(op) async {
    var pickerFile;
    if (op == 0){
      print("TOMANDO FOTO" );
      pickerFile = await picker.pickImage(source: ImageSource.camera);

    }else{
      print("ELIGIENDO FOTO" );
      pickerFile = await picker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      if(pickerFile != null){
        img = File(pickerFile.path);

        usuarioPrin.fotoPerfil = Image.file(img);
        setState(() {
          usuarioPrin.fotoPerfil = Image.file(img);
          print("ACTUALZANDO ABSES");


          FirebaseFirestore.instance.collection('users').doc(usuarioPrin.email).update({
            'imgPerfil': img.path,
          })
              .then((value) => print("Campo actualizado correctamente"))
              .catchError((error) => print("Error al actualizar campo: $error"));

        });
      }else{
        print("No se ha selecionao na");
      }
    });
  }

  Widget customBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
          children: [
            IconButton(
              iconSize: 20,
              icon: Icon(Icons.ac_unit),
              //icon: SvgPicture.network('https://acortar.link/7tj4dS'),
              //icon: const Icon(Icons.search),
              onPressed: () {  },
            ),
          ],
      ),
    );
  }


  void subirItemFAVS() async {
    for(int i=0; i<usuarioPrin.ropafav.length; i++) {
      Item item = usuarioPrin.ropafav[i];

      print("SUBIENDO ITEM  ${item.nombre},,,,,,,,,,,-----");
      //print("-----  item -> ${item.img} file-> ${file.path}");

      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child(item.img);
      File file = File(item.img);

      try {
        FirebaseFirestore.instance.collection('users').doc(usuarioPrin.email).collection("favItems").doc().set({
          'Titulo': item.nombre,
          'Descripcion': item.descripcion,
          'Tienda': item.link,
          'imagen': item.img,
          'talla': item.talla,
          'Precio': item.precio,
        });
      } catch (e) {
        print("error $e");
      }
    }
  }

}

