

import 'package:amalgamautas/class/order/order_class.dart';
import 'package:amalgamautas/model/order_model.dart';
import 'package:amalgamautas/model/payment_model.dart';
import 'package:amalgamautas/model/shipping_model.dart';
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

  //payment
  TextEditingController datePayment = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController txnId = TextEditingController();
  TextEditingController totalPayment = TextEditingController(text: '0.0');
  TextEditingController status = TextEditingController();

  GlobalKey<FormState> form = GlobalKey<FormState>();
  OrderClass orderClass = OrderClass();

  void totalData() {
    double result = double.parse(subTotal.text.isEmpty ? '0.0' : subTotal.text) +
        double.parse(taxes.text.isEmpty
            ? '0.0'
            : taxes.text.isEmpty
                ? '0.0'
                : taxes.text) +
        double.parse(cost.text.isEmpty ? '0.0' : cost.text);
    setState(() {
      total = result;
      totalPayment = TextEditingController(text: result.toString());
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
      onTap: () {
        if (inputString == 'Date') {
          showDatePicker(
                  context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2025))
              .then((value) {
            setState(() {
              date = TextEditingController(text: '${value!.day}/${value.month}/${value.year}');
            });
          });
        }else if(inputString == 'Date Payment'){
          showDatePicker(
              context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2025))
              .then((value) {
            setState(() {
              datePayment = TextEditingController(text: '${value!.day}/${value.month}/${value.year}');
            });
          });
        }
      },
    );
  }

  Column title({String? name}) {
    return Column(
      children: [
        Divider(),
        Container(
          height: 25,
          color: Colors.grey,
          alignment: Alignment.center,
          child: Text(
            name!,
            style: GoogleFonts.comicNeue(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Divider()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              title(name: 'Shipping'),
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
              title(name: 'Payment'),
              InputWidget(input: type, inputString: 'Type'),
              InputWidget(input: datePayment, inputString: 'Date Payment'),
              InputWidget(input: txnId, inputString: 'Txn Id'),
              InputWidget(input: status, inputString: 'Status'),
              InputWidget(input: totalPayment, inputString: 'Total Payment'),
              title(name: 'Order'),
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
              title(name: 'Total'),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Total: $total',
                    style: GoogleFonts.comicNeue(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
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
                        .then((value){
                          //shipping
                      orderClass
                          .createShipping(
                          dataShipping: ModelDataShipping(
                              cost: cost.text,
                              city: city.text,
                              address: address.text,
                              state: state.text,
                              country: country.text)
                              .jsonData(),
                          idOrder: value!)
                          .then((value) => print(value));

                      //payment
                      orderClass.createPayment(dataPayment: ModelDataPayment(
                        total: totalPayment.text,
                        date: datePayment.text,
                        status: status.text,
                        type: type.text,
                        txnId: txnId.text
                      ).jsonData(), idOrder: value).then((value) => print(value));
                    });
                  },
                  icon: Icon(Icons.save),
                  label: Text('Save Order'))
            ],
          )),
        ),
      ),
    );
  }
}
