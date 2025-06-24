import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/Constant.dart';

class Estadisticas extends StatefulWidget {
  const Estadisticas({Key? key}) : super(key: key);

  @override
  State<Estadisticas> createState() => _EstadisticasState();
}

class _EstadisticasState extends State<Estadisticas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [

          ],
          title: Text('Estadisticas',
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
              SizedBox(height: 30,),

              Container(
                //width: MediaQuery.of(context).size.height,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Container(
                      width: 200,
                      child: Text("Numero de items del usuario",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 200,
                      child: Text("${usuarioPrin.ropa.length}",
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                //width: MediaQuery.of(context).size.height,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Container(
                      width: 200,
                      child: Text("Numero de items favoritos del usuario",
                        style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 200,
                      child: Text("${usuarioPrin.ropafav.length}",
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                  ],
                ),
              ),


            ],
          ),
        )
    );
  }


}
