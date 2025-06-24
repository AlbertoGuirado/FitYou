import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Components/Constant.dart';
import 'MainScreen.dart';
import 'SubidaDeItem.dart';
import 'package:page_transition/page_transition.dart';

class HacerFoto extends StatefulWidget {
  const HacerFoto({Key? key}) : super(key: key);

  @override
  State<HacerFoto> createState() => _HacerFotoState();
}

class _HacerFotoState extends State<HacerFoto> {
  bool hayfoto=false;
  final _picker = ImagePicker();
  String _imagePath="";
  late File img;
  final picker  = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selImagen(1);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("-...........");
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(),
        ),
      ),
    );
  }
  Future<void> selImagen(o) async {
    var pickerFile;
    if(o == 1)
      pickerFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if(pickerFile != null){
        img = File(pickerFile.path);

        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.leftToRight,
            child: SubidaDeItem(img),
            duration: Duration(milliseconds: 500)
          ),
        );
      }else{
        print("No se ha selecionao nada");
      }
    });
  }


}
