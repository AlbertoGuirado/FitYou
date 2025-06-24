import 'package:app/Model/Usuario.dart';
import 'package:app/Screens/EditProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Components/Constant.dart';
import '../Components/GridItems.dart';
import '../Components/Login.dart';
import '../Components/SignIn.dart';
import '../Model/MiniaturaRopa.dart';
import 'Armario.dart';
import 'Estadisticas.dart';
import 'InfoItem.dart';
import 'package:firebase_storage/firebase_storage.dart';


class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {


  //Usuario usu = Usuario(nombre: "secoo", email: "email", password: "password");
  Image? imagenPerfil;
  // Obtener referencia al archivo de imagen en Firebase Storage
  //final Reference imageRef = FirebaseStorage.instance.ref().child('users/${userCredential.user.uid}/profile.jpg');
  Usuario usu = usuarioPrin;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  bool val=false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: usu.nombre == "" ? noRegistrado() : registrado() ,
      ),
    );
  }

  Widget registrado(){
    return Column(
      children: [
        SizedBox(height: 20,),
        ///PERFIL
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("69",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold
                    )
                ),
                Text("Following",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    )
                ),
              ],
            ),
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
            Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text("27",style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold
                )),
                Text("Followers",style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold
                )),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("@${usu.nombre}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),

            ),
            const SizedBox(height: 10,),
            Text("Pos este es mi perfil tu lo sabe.....",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                )
            ),
            SizedBox(height: 10,),
            Text("Instagram",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)
            ),
            SizedBox(height: 10,),
            ///botones
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [

                  Expanded(
                    child: RawMaterialButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => EditProfile(),
                            )
                        );
                      },
                      child: Container(

                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Editar Perfil",
                            style: TextStyle(
                                color: Colors.black
                            ),

                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: RawMaterialButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => Estadisticas(),
                            )
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Estadisticas",
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
            ),
          ],
        ),
        SizedBox(height: 20,),
        Container(height: 1, width: 20, color: Colors.grey[700],),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.favorite_border),
              Icon(Icons.favorite),
              Text("Tus favs",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 23,
                    color: grisPrincipal
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ContenidoDelUser(),
        ),
      ],
    );
  }

  Widget noRegistrado(){
    return Container(
      height:  MediaQuery.of(context).size.height-170,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/imgs/inicio.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Inicio sesion
            SizedBox(height: 50.0),
            Stack(
              children: [
                Positioned(

                  child:
                  Container(
                    width: 200,
                    height: 60,
                    //padding: EdgeInsetsDirectional.all(10),
                    //color: Colors.green,
                    decoration: BoxDecoration (
                      border:  Border.all(color: Colors.white70),
                      borderRadius:  BorderRadius.circular(10),
                      //color: Colors.green,

                    ),
                    margin: EdgeInsets.only(top: 10, left: 10),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    minimumSize: Size(200, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      //side: BorderSide(color: Colors.lightBlueAccent, width: 2),

                    ),
                    backgroundColor: Colors.white,

                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text('Iniciar Sesion',
                    style:  TextStyle (
                      fontFamily: 'Poppins',
                      fontSize:  15,
                      fontWeight:  FontWeight.w800,
                      height:  1.5,
                      color:  Color(0xff454545),
                    ),
                  ),
                ),

              ],
            ),


            SizedBox(height: 22.0),
            //Registro
            Stack(
              children: [
                Positioned(

                  child:
                  Container(
                    width: 200,
                    height: 60,
                    //color: Colors.green,
                    decoration: BoxDecoration (
                      border:  Border.all(color: Colors.white70),
                      borderRadius:  BorderRadius.circular(10),
                      //color: Colors.green,
                    ),
                    margin: EdgeInsets.only(top: 10, left: 10),

                  ),

                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    minimumSize: Size(200, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      //side: BorderSide(color: Colors.lightBlueAccent, width: 2),

                    ),
                    backgroundColor: Colors.white,

                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SigIn()));

                  },
                  child: Text('Registrarse',
                    style:  TextStyle (
                      fontFamily: 'Poppins',
                      fontSize:  15,
                      fontWeight:  FontWeight.w800,
                      height:  1.5,
                      color:  Color(0xff454545),
                    ),
                  ),
                ),

              ],
            ),


          ],
        ),
      ),
    );
  }

  void cambiaTema(bool valor) {
      setState(() {
        val = valor;
      });
  }
  Widget ContenidoDelUser() {
    Size size = MediaQuery.of(context).size;
    setState(() {});

    return usu.ropafav.length == 0 ?
    Center(
        child: Container(
          height: 40,
          width: 250,
          decoration: BoxDecoration(
            color: Color(0xfffcfcfd),
            border: Border.all(color: grisPrincipal ),
            borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child:
                Text("No hay coincidencias",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xff494949),
                  fontSize: 20,
                ),
                ),
            ),
        ),
    )
    :
    GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 300,
      ),

      itemBuilder: (context, index) {
    return RawMaterialButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InfoItem(
                    ropa: usu.ropafav[index],
                  )
              )
          );
        },
        child: MiniaturaRopa(ropa: usu.ropafav[index])
    );
      },
      itemCount: usu.ropafav.length,
      );
  }

}

