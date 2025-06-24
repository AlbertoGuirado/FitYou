

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/Constant.dart';
import '../Model/FuncionPrincipal.dart';
import '../Model/MiniaturaRopa.dart';
import 'InfoItem.dart';


class Armario extends StatefulWidget {
  const Armario({Key? key}) : super(key: key);

  @override
  State<Armario> createState() => _ArmarioState();
}

class _ArmarioState extends State<Armario> {

  /*final Usuario usu = Usuario(
      nombre: "suloko",email:  "emaio",password:  "pass", fotoPerfil: Image.network("https://acortar.link/etPIqh"),
      ropa: ServicioRopasDelUser().fitYouClothes);*/
  //Usuario usu = Usuario(nombre: "nombre", email: "email", password: "password");

  //final servicioRfopas = ServicioRopasDelUser();


  @override
  Widget build(BuildContext context) {
    //usu.ropa = ServicioRopasDelUser().fitYouClothes;
    //usuarioPrin.ropa.addAll(ServicioRopasDelUser().fitYouClothes);

    //print("ROPA sin meter> ${usuarioPrin.ropa.length}");
    //usuarioPrin.ropa.addAll(ServicioRopasDelUser().fitYouClothes);


    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 10.0),
              child: Text(
                "MI ARMARIO",
                style: TextStyle(
                  color: grisSecund,
                  fontSize: 30,
                  fontWeight: FontWeight.w700
                ),

              ),
            ),
            FuncionPrincipal(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: itemArmario2(),/*Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height+600, // Altura máxima del contenedor igual a la altura de la pantalla
                  maxWidth: MediaQuery.of(context).size.width, // Ancho máximo del contenedor igual al ancho de la pantalla
                ),
                child: itemArmario2(),
              ),*/
            ),
          ],
        ),
      ),
    );
  }

  ///FUTURE BUILDER
 /* Widget itemsArmario(){
    return Center(
      child: FutureBuilder(
        future: servicioRopas.getRopas(),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError){
              return const Center(
                child: Text("Errorrr de conexion"),
              );
            }else{
              //return GridArmario(ropas: snapshot.data);
              final List<Item> ropas = snapshot.data;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (context, index) {
                  /*Image m = Image.asset(ropas[index].img);
        double? mh = m.height;
        double? mw = m.width;
        double aspec = mw! / mh!;*/
                  return RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InfoItem(
                                  ropa: ropas[index],
                                )
                            )
                        );
                      },
                      child: MiniaturaRopa(ropa: ropas[index])
                  );
                },
                itemCount: ropas.length,
              );
            }
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }*/

  Widget itemArmario2(){

    Size size = MediaQuery.of(context).size;
    return usuarioPrin.ropa.length == 0 ?
    Center(
      child: Container(
        height: 40,
        width: 250,
        decoration: BoxDecoration(
          color: Color(0xfffcfcfd),
          border: Border.all(color: grisPrincipal ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
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
                        ropa: usuarioPrin.ropa[index],
                      )
                  )
              );
            },
            child: MiniaturaRopa(ropa: usuarioPrin.ropa[index])
        );
      },
      itemCount: usuarioPrin.ropa.length,
    );
  }
}
/*
class GridArmario extends StatelessWidget {
  final List<Item> ropas;
  const GridArmario({Key? key, required this.ropas}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 300,
      ),
      itemBuilder: (context, index) {
        /*Image m = Image.asset(ropas[index].img);
        double? mh = m.height;
        double? mw = m.width;
        double aspec = mw! / mh!;*/
        return RawMaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InfoItem(
                        ropa: ropas[index],
                      )
                  )
              );
            },
            child: MiniaturaRopa(ropa: ropas[index])
        );
      },
      itemCount: ropas.length,
    );
  }
}
*/

