


import 'package:app/Components/Constant.dart';
import 'package:app/Screens/Armario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

import 'Busqueda.dart';
import 'HacerFoto.dart';

import 'Home.dart';
import 'SubidaDeItem.dart';
import 'User.dart';
import 'dart:io';

class MainScreen extends StatefulWidget {

  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreen();

}


class _MainScreen extends State<MainScreen>{

  int cat = 0;
  int despl=0;
  int currentTab=0;
  static var paginas = [
    Home(),///METIENDO CONTEXT AQUI????
    Busqueda(),
    Armario(),
    User(),
  ];
  Widget currentScreen = Home();
  final PageStorageBucket bucket = PageStorageBucket();

  void pulsar(int ind){
    setState(() => cat = ind);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          //customBar(),
        ],
        title: Text('FITYOU',
          style: TextStyle(
            fontWeight:  FontWeight.w900,
            color: Colors.greenAccent,
          ),
        ),
        //iconTheme: IconThemeData(),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white70,
        elevation: 0,
      ),

      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt_outlined),
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          if(usuarioPrin.nombre==""){
            setState(() {
              //Icon(Icons.user, color: currentTab == 3 ? Colors.greenAccent : Colors.grey,size: tamIconos,);

              currentScreen = User();
              currentTab = 3;
            },);
          }else
            selImagen(1);
        },

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                  minWidth: 40,
                  splashColor: Colors.white,
                  highlightColor: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.dashboard, color: currentTab == 0 ? Colors.greenAccent : Colors.grey,
                        size: tamIconos,
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = Home();
                      currentTab = 0;
                    },);
                  }

                  ),
              MaterialButton(
                  minWidth: 40,
                  splashColor: Colors.white,
                  highlightColor: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(Icons.search, color: currentTab == 1 ? Colors.greenAccent : Colors.grey,size: tamIconos,),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = Busqueda();
                      currentTab = 1;
                    },);
                  }

              ),
              SizedBox(width: 20,),
              MaterialButton(
                  minWidth: 40,
                  splashColor: Colors.white,
                  highlightColor: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(Icons.wb_cloudy, color: currentTab == 2 ? Colors.greenAccent : Colors.grey,size: tamIconos,),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = Armario();
                      currentTab = 2;
                    },);
                  }

              ),
              MaterialButton(
                  minWidth: 40,
                  shape: CircleBorder(),
                  //focusColor: Colors.greenAccent,
                  splashColor: Colors.white,
                  highlightColor: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///SE PUEDE SUSTITUIR CON LA IMAGEN
                      Container(
                        height: 30,
                        width: 30,
                        child: usuarioPrin.nombre!="" ?
                        ClipOval(
                          child: Image(
                            fit: BoxFit.cover,
                            image: usuarioPrin.fotoPerfil.image,//AssetImage("assets/imgs/perfil.jpg"),
                          ),
                        )
                            :
                        Icon(Icons.person, color: currentTab == 3 ? Colors.greenAccent : Colors.grey,size: tamIconos,),


                      ),
                      //Icon(Icons.person, color: currentTab == 3 ? Colors.greenAccent : Colors.grey,size: tamIconos,),
                    ],
                  ),
                  onPressed: () {
                    setState(() {

                      currentScreen = User();
                      currentTab = 3;
                    },);
                  }

              ),

            ],
          ),
        ),
      ),

    );
  }

  Widget customBajr(){
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              IconButton(
                iconSize: 20,
                icon: SvgPicture.asset('assets/icons/foto.svg'),
                //icon: SvgPicture.network('https://acortar.link/7tj4dS'),
                //icon: const Icon(Icons.search),
                onPressed: () {  },
              ),
              IconButton(
                iconSize: 20,
                icon: SvgPicture.asset('assets/icons/slider.svg'),
                //icon: const Icon(Icons.search),
                onPressed: () {  },
              ),
            ],
          ),
        ],
      ),
    );
  }
  ///BOTON
  final _picker = ImagePicker();
  String _imagePath="";
  late File img;
  final picker  = ImagePicker();
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