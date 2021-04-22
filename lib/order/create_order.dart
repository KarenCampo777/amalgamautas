import 'dart:html';

import 'package:amalgamautas/class/order/order_class.dart';
import 'package:amalgamautas/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateOrder extends StatefulWidget {
  @override
  _CreateOrderState createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  //order
  TextEditingController date = TextEditingController();
  double total = 0.0;
  TextEditingController subTotal = TextEditingController(text: '0.0');
  TextEditingController taxes = TextEditingController(text: '0.0');
  bool paid = false;

  //shipping
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController cost = TextEditingController(text: '0.0');

  GlobalKey<FormState> form = GlobalKey<FormState>();
  OrderClass orderClass = OrderClass();

  void totalData() {
    double result = double.parse(subTotal.text.isEmpty ? '0.0' : subTotal.text) +
        double.parse(taxes.text.isEmpty ? '0.0' : taxes.text.isEmpty ? '0.0' : taxes.text) +
        double.parse(cost.text.isEmpty ? '0.0' : cost.text);
    setState(() {
      total = result;
    });
  }

  TextFormField InputWidget({required TextEditingController input, required String inputString}) {
    return TextFormField(
      controller: input,
      decoration: InputDecoration(
        labelText: inputString,
      ),
      onChanged: (value) {
        totalData();
      },
    );
  }


  Container title({String? name}){
    return Container(
      height: 25,
      color: Colors.grey,
      alignment: Alignment.center,
      child: Text(
        name!,
        style: GoogleFonts.comicNeue(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Order'),
      ),
      body: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(),
          title(name: 'Shipping'),
          Divider(),
          InputWidget(
            input: address,
            inputString: 'Address',
          ),
          InputWidget(
            input: city,
            inputString: 'City',
          ),
          InputWidget(
            input: state,
            inputString: 'State',
          ),
          InputWidget(
            input: country,
            inputString: 'Country',
          ),
          InputWidget(
            input: cost,
            inputString: 'Cost',
          ),
          Divider(),
          title(name: 'Order'),
          Divider(),
          InputWidget(
            input: date,
            inputString: 'Date',
          ),
          InputWidget(
            inputString: 'Taxes',
            input: taxes,
          ),
          InputWidget(
            input: subTotal,
            inputString: 'Subtotal',
          ),
          Text('Total: $total'),
          ElevatedButton.icon(
              onPressed: () {
                orderClass
                    .createOrder(
                        dataOrder: ModelDataOrder(
                                date: date.text,
                                paid: paid,
                                subTotal: subTotal.text,
                                taxes: taxes.text,
                                total: total.toString())
                            .jsonData())
                    .then((value) => print(value));
              },
              icon: Icon(Icons.save),
              label: Text('Save Order'))
        ],
      )),
    );
  }
}
