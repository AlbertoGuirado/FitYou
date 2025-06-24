
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Model/Usuario.dart';
import '../Screens/User.dart';


const kSecColor = Color(0xff0C9869);
const grisPrincipal = Color(0xff2d2d2d);
const grisSecund = Color(0xff565656);
const tamIconos = 30.0;
const itemTemaOscuro = Color(0xff2d2d2d);
Widget IconHoodie = Image.asset('assets/icons/hoodie.png');
Widget IconCargo = Image.asset('assets/icons/pant.png');
Widget IconShort = Image.asset('assets/icons/shorts.png');
Widget IconPolo = Image.asset('assets/icons/polo.png');
Widget IconTshirt = Image.asset('assets/icons/tshirt.png');
Widget IconSneakers = Image.asset('assets/icons/sneakers.png');
Widget IconPants = Image.asset('assets/icons/trousers.png');

Image imagenPerf = Image.network('');

Usuario usuarioPrin = Usuario(nombre: "", password: "", email: "");