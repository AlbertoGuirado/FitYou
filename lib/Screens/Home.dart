import 'package:app/Components/Constant.dart';
import 'package:app/Model/LoadingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Model/FuncionPrincipal.dart';
import '../Model/Item.dart';
import '../Model/MiniaturaRopa.dart';
import '../Model/ServicioRopaRecom.dart';
import '../Model/cloth_carousel.dart';
import 'Armario.dart';
import 'InfoItem.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin{
  bool get wantKeepAlive => true;


  List<Item> listaObtenida1 = List.from(ServicioRopasRecom().fitYouClothes1);
  List<Item> listaObtenida2 = List.from(ServicioRopasRecom().fitYouClothes2);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              recompeq('stockx.com/es-es/nike-dunk-low-sp-syracuse','assets/imgs/or1.jpg'),
              FuncionPrincipal(),
              recomCarro(context, listaObtenida1),
              recomGrande('www.karlkani.com/pages/celebs-in-kani','assets/imgs/fit1.jpg','Puff Daddy x Karl Kani','Descuble el nuevo lanzamiento de Karl Kani en colaboracion con Puff Daddy'),
              recomCarro(context, listaObtenida2),
              recompeq('stockx.com/es-es/nike-big-swoosh-reversible-boa-jacket-asia-sizing-black-white','assets/imgs/promo.jpg'),
              recomCarro(context, listaObtenida1),
              recomGrande('www.zalando.es/outfits/VBCzd442ROq/',
                  'https://img01.ztat.net/outfit/a3d9619312364dc8b4be38681ac8d9d1/6ba219748bfb4e77b40d2c92efce0acb.jpg?imwidth=1800',
                  'Get the look',
                  'Explora, arriesga y disfruta. ¡Aquí tienes una selección de mis prendas favoritas!'),
              Container(
                  height: 100,
                  width: 100,
                  child: LoadingScreen()),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _launchInBrowser(String url) async {
    List<String> urlParts = url.split('/');
    print("------ ${urlParts[1]}/${urlParts[2]}");
    final Uri uri = Uri(scheme: "https",host: urlParts[0] , path: urlParts[1]+"/"+urlParts[2]);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,)
    ){
      throw Exception('Could not launch ------------------------------ $url');
    }
  }
  Widget recompeq(url, img){
    return RawMaterialButton(


      onPressed: () async {
        _launchInBrowser(url);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                )
              ),
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150.0, left: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      "New Nike Dunks Orange",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 23,
                      color: CupertinoColors.white,
                    ),
                  ),
                  Text(
                    "Snipes.com",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.blue[300],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget funcPrincipal(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text('For uuu',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),

        //ClothCarousel(this.fitYouClothes),
      ],
    );
  }

  Widget recom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: 300,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
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
                            ropa: listaObtenida1[index],
                          )
                      )
                  );
                },
                child: MiniaturaRopa(ropa: listaObtenida1[index])
            );
          },
          itemCount: listaObtenida1.length,
        ),
      ),
    );
  }

  Widget recomCarro(context, lista){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('For you',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),

          ClothCarousel(lista),
        ],
      ),
    );
  }

  Widget recomGrande(url, String img, titulo,contenido){
    var internet=false;
    ImageProvider imageProvider = NetworkImage(img);
    if(img.startsWith("https")||img.startsWith("www.")){
      internet=true;
    }

    return RawMaterialButton(
    onPressed: () async {
      _launchInBrowser(url);
    },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  image: DecorationImage(
                    image: internet ? imageProvider : AssetImage(img) ,
                    fit: BoxFit.cover,
                  )
              ),
              height: 600,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 360.0, left: 0, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              titulo,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 46,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffdeff8b),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Zalando.es",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Color(0xff008cff),
                          ),
                        ),
                      ],

                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      contenido,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

}
