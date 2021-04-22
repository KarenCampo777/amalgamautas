import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductList extends StatelessWidget {
  Card productData({required String img, required String name, required String value, required String description}) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              img,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: ListTile(
              leading: Text('\$$value', style: GoogleFonts.comicNeue(fontWeight: FontWeight.bold, fontSize: 30),),
              title: Text(name, style: GoogleFonts.comicNeue(),),
              subtitle: Text(description, style: GoogleFonts.comicNeue(),),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        productData(img: 'images/product1.png', name: 'V for Vendetta Comic', value: '28', description: 'An scarce comic book written and illustrated by Alan Moore and David Lloyd. Printed and distributed by DC Comics in the UK in 1988. Did you know that V for Vendetta was a comic book before the movie? A beautiful piece of collection and sublime art'),
        productData(img: 'images/product2.png', name: 'Batman limited Doll', value: '200', description: 'The Batman statue is a hand painted and sculpted limited edition of only 4000 units in the whole world, based on the mini series Black and White. Designed by Paul Pope, sculped by ST. Jean is made of cold- cast porcelain. Only for real fans!'),
        productData(img: 'images/product3.png', name: 'Yoda Doll', value: '15', description: 'Adorable Mini Yoda from Star Wars Stuffed Toy Doll, filled material-PP Cotton. Master Yoda speaks the following phrases: "When 900 years you reach, look as good you will not.", "For 800 years have I trained Jedi.", "Do, or do not. There is no try.", "Concentrate, feel the Force flow, yes.", "Judge me by my size, do you?", "Size matters not."'),
        productData(img: 'images/product4.jpg', name: 'Mask Alien ', value: '10', description: 'desc'),
        productData(img: 'images/product5.jpg', name: 'Star Wars Comic ', value: '12', description: 'desc')
      ],
    );
  }
}
