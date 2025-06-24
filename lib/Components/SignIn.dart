import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Model/LoadingScreen.dart';
import '../Model/Usuario.dart';
import '../Screens/MainScreen.dart';
import 'Constant.dart';

class SigIn extends StatefulWidget {
  @override
  _SigIn createState() => _SigIn();
}

class _SigIn extends  State<SigIn> {

  String errorMessage = ''; // agregar esta línea al inicio del widget stateful

  String email="";
  String nombre="";
  String pass="";
  String confPass="";
  Usuario? user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff698aff),
      body: SingleChildScrollView(

        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/imgs/inicio.png'),
              fit: BoxFit.cover,
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.only(top: 200, left: 10),
            child: Column(
              children: [
                Stack(
                  children: [
                    Positioned(

                      child:
                      Container(
                        width: 300,
                        height: 500,
                        //color: Colors.green,
                        decoration: BoxDecoration (
                          border:  Border.all(color: Colors.white70),
                          borderRadius:  BorderRadius.circular(10),
                          //color: Colors.green,
                        ),
                        margin: EdgeInsets.only(top: 10, left: 10),

                      ),

                    ),
                    Container(
                      //padding: const EdgeInsets.only(top: 200),
                      child: Container(

                        height: 500,
                        width: 300,
                        //margin:  EdgeInsets.symmetric(vertical: 150, horizontal: 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.center,
                          //padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30 ),
                          children: [
                            //Texto sup
                            Center(
                              child: Container(
                                margin:  EdgeInsets.only(top: 50, left: 10),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      //icon: SvgPicture.network('https://www.svgrepo.com/show/507493/arrow-left-circle.svg'),
                                      icon: Icon(Icons.arrow_circle_left_outlined, size: 35,),
                                      //iconSize: 4,
                                      hoverColor: Colors.redAccent,

                                    ),
                                    Text(
                                      'Registro',
                                      style: TextStyle(
                                        fontSize: 35,
                                        color: Color(0xff454545),
                                        fontWeight: FontWeight.w900,
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Input INICIAR SESION
                            SizedBox(height: 30.0),
                            _inputNombre(),
                            SizedBox(height: 15.0),
                            _inputCorreo(),
                            SizedBox(height: 15.0),
                            _inputPass(),
                            SizedBox(height: 15.0),
                            _inputPassConf(),
                            SizedBox(height: 40.0),
                            //BOTON
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
                                      border:  Border.all(color: Color(0xff454545)),
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
                                    backgroundColor: Color(0xff454545),

                                  ),
                                  onPressed: () async {
                                    //print("contrasena -> $pass - email: $email");
                                    String error ="";
                                    try {

                                      if(pass != confPass){
                                        error="LAS CONTRASEÑAS NO COINCIDEN";
                                        throw Exception("");
                                      }
                                      if(pass.length < 6) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('La contraseña debe tener minimo 6 caracteres'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                      final querySnapshot = await FirebaseFirestore.instance.collection('users').where(email, isEqualTo: email).get();

                                      if(!querySnapshot.docs.isNotEmpty) {
                                        ///SE REGISTRA YA QUE NO ESTA
                                        usuarioPrin = Usuario(nombre: nombre,
                                            email: email,
                                            password: pass);
                                        Image pred = Image.asset(
                                            "assets/imgs/profileDef");
                                        usuarioPrin.fotoPerfil = pred;
                                        //UserCredential crd = await FirebaseAuth.instance;
                                        UserCredential crd = await FirebaseAuth
                                            .instance
                                            .createUserWithEmailAndPassword(
                                            email: email,
                                            password: pass);
                                        _loadUserName(crd);

                                        FirebaseFirestore.instance.collection(
                                            "users").doc(email).set(
                                            {
                                              'nombre': nombre,
                                              'email': email,
                                              'imgPerfil' : "assets/imgs/profileDef.png",
                                            });
                                        // Si el inicio de sesión es exitoso, puedes navegar a otra pantalla
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Inicio de sesión exitoso'),
                                            backgroundColor: Colors.green,
                                          ),
                                        );

                                        Navigator.push(context,
                                            MaterialPageRoute(
                                              builder: (context) => LoadingScreen(),
                                            )
                                        );

                                        Future.delayed(Duration(seconds: 1), () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => MainScreen()),
                                          );
                                        });
                                      }else{
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text("USUARIO YA REGISTRADO"),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      };
                                    } catch (e) {
                                      // Si hay un error, puedes mostrar un mensaje al usuario
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(error),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  },
                                  child: Text('Registro',
                                    style:  TextStyle (
                                      fontFamily: 'Poppins',
                                      fontSize:  15,
                                      fontWeight:  FontWeight.w800,
                                      height:  1.5,
                                      color:  Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      //resizeToAvoidBottomInset: false,
    );


  }
  Padding _inputNombre(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Color(0xf3394949)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
            onChanged: (value){
              setState(() {
                nombre = value;
              });
            },
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontFamily: 'Poppins',
              color: Color(0xff494949),
            ),
            //keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Nombre de usuario',
              //labelText: 'Email',
              //hintText: '',
              //icon: Icon(Icons.email),
            ),
          ),
        ),
      ),
    );
  }
  Padding _inputCorreo(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Color(0xf3394949)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
            onChanged: (value){
              setState(() {
                email = value;
              });
            },
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontFamily: 'Poppins',
              color: Color(0xff494949),
            ),
            //keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Email',
              //labelText: 'Email',
              //hintText: '',
              //icon: Icon(Icons.email),
            ),
          ),
        ),
      ),
    );
  }
  Padding _inputPass(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Color(0xf3394949)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
            onChanged: (pa){
              setState(() {
                pass = pa;
              });
            },
            obscureText: true,
            style: TextStyle(

              fontWeight: FontWeight.w800,
              fontFamily: 'Poppins',
              color: Color(0xff494949),
            ),

            //keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Password',
              //labelText: 'Email',
              //hintText: '',
              //icon: Icon(Icons.email),
            ),
          ),
        ),
      ),
    );
  }
  Padding _inputPassConf(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Color(0xf3394949)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
            onChanged: (pa){
              setState(() {
                confPass = pa;
              });
            },
            obscureText: true,
            style: TextStyle(

              fontWeight: FontWeight.w800,
              fontFamily: 'Poppins',
              color: Color(0xff494949),
            ),

            //keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Password confirm',
              //labelText: 'Email',
              //hintText: '',
              //icon: Icon(Icons.email),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _loadUserName(UserCredential userCredential) async {
    final data = userCredential.user?.email;
    //print("ssssss -> ${data}");
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    //print("AGGGGG -> ${userDoc.exists}");
    final userData = userDoc.metadata;
    FirebaseAuth auth = FirebaseAuth.instance;
    User? use = auth.currentUser;

    print("AGGGGG -> ${use?.email}");
    print("AGGGGG -> ${use?.email}");

    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) async {
      if (querySnapshot.docs.isNotEmpty) {
        String userId = querySnapshot.docs.first.data().toString();
        try {
          var datos = querySnapshot.docs[0].data() as Map<String, dynamic>;
          String nombre = datos["nombre"];


          usuarioPrin = Usuario(nombre: nombre , email: email, password: pass);

          print("IMAAAAAA-----------------------AAAAAAAAAAAAGE ${userId}");
        }catch(e) {
          print("---- COISTIOOOON $e");
        }

      } else {
        print('No se encontraron usuarios con el correo electrónico especificado');
      }
    });





  }

}