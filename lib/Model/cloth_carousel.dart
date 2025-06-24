import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../Screens/ItemPequeno.dart';
import 'Item.dart';

class ClothCarousel extends StatelessWidget {
  List<Item> ropas;
  ClothCarousel(this.ropas);
  Random r = Random();

  @override
  Widget build(BuildContext context) {
    //return Container(color: Colors.red, height: 100.0,);
    ///listView.builder

    return CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: false,
        reverse: false,
        viewportFraction:  0.86,
        height: 350,
      ),
      //items: this.ropas.map((e) => ItemZapatilla(e, themeDark: ropas.indexOf(e) == 0)).toList(),
      items: this.ropas.map((e) => ItemPequeno(e, themeDark: ropas.indexOf(e) == 1)
      ).toList(),

      /*
      items: <Widget>[
        ItemJob(themeDark: true,),
        ItemJob(themeDark: false,),
        ItemJob(themeDark: true,),

        //Container(margin: EdgeInsets.all(3.0),color: Colors.red,),

      ],*/
    );
  }
}