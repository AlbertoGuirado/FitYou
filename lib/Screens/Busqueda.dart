import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Components/Constant.dart';
import '../Model/Item.dart';
import '../Model/MiniaturaRopa.dart';
import 'Armario.dart';
import 'InfoItem.dart';

class Busqueda extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<Busqueda> {
  final _searchController = TextEditingController();
  final List<String> _searchHistory = [];

  void _search() {
    final searchTerm = _searchController.text;
    // Lógica para buscar los resultados
    // y actualizar la lista de resultados de búsqueda.
    setState(() {
      _searchHistory.insert(0, searchTerm);
    });
  }
  static List<Item> fitYouClothes = [
    Item("Cargo Pants",
        "dessssscccc",
        'assets/imgs/dunk.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
        320,
      "sistema"
    ),
    Item("CargoPants",
        'desc',
        'assets/imgs/cargo2.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      320,
        "sistema"
    ),
    Item("Grey Hoodie",
      'desc',
      'assets/imgs/hgrey.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      320,"sistema"
    ),
    Item("Pink hoodie",
        'sds',
        'assets/imgs/hpin.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      320,"sistema"
    ),
    Item("JACKET",
        'dsds',
        'assets/imgs/p3.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      320,"sistema"
    ),
    Item("Jeans wide skate",
        'desccc',
        'assets/imgs/pant.jpg',
      'www.stockx.com/es-es/nike-dunk-low-travis-scott-x-playstation',
      'talla',
      320,"sistema"
    ),
  ];
  void actualizaListaRopaConIcono(){
    for(int i=0;i<fitYouClothes.length;i++){
      fitYouClothes[i].setIcono();
    }
  }
  List<Item> listaObtenida = List.from(fitYouClothes);
  void updateList(String value){
    setState(() {
      listaObtenida = fitYouClothes
          .where((element) =>
              element.nombre!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
  void updateListIcon(IconData value){
    setState(() {
      listaObtenida.clear();
      actualizaListaRopaConIcono();
      for(int i=0; i<fitYouClothes.length;i++){
        if(fitYouClothes[i].icono.toString().contains(value.toString())){
          listaObtenida.add(fitYouClothes[i]);
        }
      }
    });
  }
  void updateListIcon2(Widget value){
    setState(() {
      listaObtenida.clear();
      actualizaListaRopaConIcono();
      for(int i=0; i<fitYouClothes.length;i++){
        if(fitYouClothes[i].icono == value){
          listaObtenida.add(fitYouClothes[i]);
        }

      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    actualizaListaRopaConIcono();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    actualizaListaRopaConIcono();
    return SingleChildScrollView(
      child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///BARRA DE BUSQUEDA
              TextField(
                onChanged: (value) => updateList(value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffeeeeee),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    //borderSide: BorderSide.none,
                    borderSide: BorderSide(color: grisPrincipal)
                  ),
                    hintText: "Busqueda",
                  prefixIcon: Icon(Icons.search),
                  focusColor: Color(0xff59ffad),
                  hoverColor: Color(0xff59ffad),
                  //prefixIconColor: Colors.white
                ),
              ),

              SizedBox(height: 20,),
              ///SCROLL LATERAL
              busquedaIconos(size),
              SizedBox(height: 20,),

              ///CONTENIDO
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ContenidoDelUser(),
              ),

            ],
          ),
      ),
      ),
    );
  }
  Widget busquedaIconos(size){
    return Container(
          height: 80,
          width: size.width,
          decoration: BoxDecoration(
            color: Color(0xffeeeeee),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.greenAccent),
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),

            children: [
              IconButton(
                  onPressed: (){
                    //fitYouClothes[0].setIcono();
                    updateListIcon2(IconHoodie);
                  }, icon: IconHoodie
              ),
              IconButton(
                  onPressed: (){
                    //fitYouClothes[0].setIcono();
                    updateListIcon2(IconTshirt);
                  }, icon: IconTshirt
              ),
              IconButton(
                  onPressed: (){
                    //fitYouClothes[0].setIcono();
                    updateListIcon2(IconPolo);
                  }, icon: IconPolo
              ),
              IconButton(
                  onPressed: (){
                    //fitYouClothes[0].setIcono();
                    updateListIcon2(IconCargo);
                  }, icon: IconCargo
              ),
              IconButton(
                  onPressed: (){
                    //fitYouClothes[0].setIcono();
                    updateListIcon2(IconShort);
                  }, icon: IconShort
              ),
              IconButton(
                  onPressed: (){
                    //fitYouClothes[0].setIcono();
                    updateListIcon2(IconSneakers);
                  }, icon: IconSneakers
              ),
              IconButton(
                  onPressed: (){
                    //fitYouClothes[0].setIcono();
                    updateListIcon2(IconPants);
                  }, icon: IconPants
              ),

            ],
          ),


    );
  }

  Widget ContenidoDelUser() {
    Size size = MediaQuery.of(context).size;
    print("---------<${listaObtenida.length}");
    return listaObtenida.length == 0 ?
    Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 220,
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
        ],
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
                        ropa: listaObtenida[index],
                      )
                  )
              );
            },
            child: MiniaturaRopa(ropa: listaObtenida[index])
        );
      },
      itemCount: listaObtenida.length,
    );
  }

}
