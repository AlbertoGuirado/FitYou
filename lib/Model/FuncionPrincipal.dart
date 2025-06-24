
//import 'dart:html';


import 'package:app/Components/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../Screens/SubidaDeItem.dart';

class FuncionPrincipal extends StatefulWidget{
  @override
  _ImagenState createState() => _ImagenState();
}

class _ImagenState extends State<FuncionPrincipal>{
  final _picker = ImagePicker();
  String _imagePath="";
  late File img;
  final picker  = ImagePicker();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child:
      Container(
        height: 150,
        width: 400,
        padding: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: CupertinoColors.tertiaryLabel),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _tomarFoto(),
            Container(
              color: Color(0xFFBDBDBD),
              height: 90,
              width: 2,
            ),
            _sacarFoto(),
          ],
        ),
      ),
    );



  }

  Widget _tomarFoto(){
    return InkWell(
      onTap: () {
        selImagen(2);
      },
      child: Container(
        width: 120,
        height: 120,
        child: Icon(
          Icons.image,
          size: 50,
        ),
      ),
    );
  }
  Widget _sacarFoto(){
    return InkWell(
      onTap: (){
        selImagen(1);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(

          //width: 100,
          child:
          Icon(
            Icons.photo_camera,
            size: 50,
            color: grisPrincipal,
          ),

        ),
      ),
    ); //ite darle a click a todo
  }



  Future<void> selImagen(op) async {
    var pickerFile;
    if (op == 1){
      print("TOMANDO FOTO" );
      pickerFile = await picker.pickImage(source: ImageSource.camera);

    }else{
      print("ELIGIENDO FOTO" );
      pickerFile = await picker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      if(pickerFile != null){
        img = File(pickerFile.path);

        Navigator.push(
          context,
          MaterialPageRoute(
            //builder: (context) =>  MyWidget(imagePath: img.path),

            builder: (context) =>  SubidaDeItem(img),
          ),
        );
      }else{
        print("No se ha selecionao na");
      }
    });
  }

}