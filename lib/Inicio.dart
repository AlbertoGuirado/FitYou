import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Components/Login.dart';
import 'Components/SignIn.dart';
import 'Model/LoadingScreen.dart';
import 'Screens/MainScreen.dart';


class MyHomePage extends StatelessWidget {
  bool isPressed=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff698aff),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imgs/inicio.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          //padding:  EdgeInsets.fromLTRB(30,100,0,0),
          child: Column(
            children: [
              //Texto superior
              Container(
                margin: EdgeInsets.only(top:100, bottom: 20, right: 100, left: 0),
                child: Text(
                  'Personaliza,\nCrea,\nComparte',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              //Texto Inferior
              Container(
                margin: EdgeInsets.only(top:0, bottom: 0, right: 200, left: 0),
                child: Text(
                  'FitYou',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),

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

              SizedBox(height: 70.0),
              TextButton(

                onPressed: () {

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
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      isPressed ? Colors.deepOrange : Colors.redAccent
                  ),
                ),
                child: Text('Omitir',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize:  20,
                    fontWeight:  FontWeight.w900,
                    //height:  1.5,
                    color:  Color(0xff454545),

                  ),

                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}