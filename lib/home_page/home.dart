import 'package:amalgamautas/order/create_order.dart';
import 'package:amalgamautas/order/list_order.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amalgamautas', style: GoogleFonts.comicNeue(color: Colors.white)),
        actions: [
          TextButton.icon(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateOrder()));
              },
              icon: Icon(Icons.create, color: Colors.white,),
              label: Text('Create Order', style: GoogleFonts.comicNeue(color: Colors.white),))
        ],
      ),
      body: ListOrder(),
    );
  }
}
