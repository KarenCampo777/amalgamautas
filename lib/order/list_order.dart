import 'package:amalgamautas/class/order/order_class.dart';
import 'package:amalgamautas/model/order_model.dart';
import 'package:flutter/material.dart';

class ListOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ModelDataOrder>>(stream: OrderClass().listOrders(),builder: (context, snapshot){
      if(snapshot.hasError) return Text(snapshot.error.toString());
      if(snapshot.connectionState == ConnectionState.waiting) return CircularProgressIndicator();
      return ListView.builder(itemCount: snapshot.data!.length,itemBuilder: (context, index){
        ModelDataOrder modelDataOrder = snapshot.data![index];
        print(modelDataOrder.total);
        return ListTile(
          title: Text(modelDataOrder.total!),
          subtitle: Text(modelDataOrder.date!),
        );
      });
    });
  }
}
